<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Facades\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Auth;
use DateTime;
use DateTimeZone;
use DateInterval;

class HomeController extends Controller
{
    protected $google_client_id;
    protected $google_client_secret;
    protected $google_redirect_uri;
    protected $google_scope;
    protected $fitData;

    public function __construct() {
        $this->google_client_id = "129326742192-18k3f6cemlsj8c4sna7qep99cbiufm6d.apps.googleusercontent.com";
        $this->google_client_secret = "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";

        $this->google_redirect_uri = route(config('admin.route.prefix').'.googleFitInitiate');
        $this->google_scope = urlencode("https://www.googleapis.com/auth/fitness.activity.read")
            ."+".urlencode("https://www.googleapis.com/auth/fitness.body.read")
            ."+".urlencode("https://www.googleapis.com/auth/fitness.heart_rate.read")
            ."+".urlencode("https://www.googleapis.com/auth/fitness.location.read");
    }

    public function index(Content $content)
    {
        $user = Auth::user();

        $content->title('Dashboard');

        if (!$user->google_fit_refresh_token) {
            $content->row($this->googleFitInitBtn());
        } else {
            $googleToken = $this->getGoogleToken($user);
            if (!$googleToken)
                return redirect()->refresh();

            $this->getGoogleFitData($googleToken);

            $content->row(function (Row $row) {

                $row->column(12, function (Column $column) {
                    $column->append('<div class="box"><p>'.$this->quotes().'</p></div>');
                });

                $row->column(4, function (Column $column) {
                    $column->append($this->step());
                });

                $row->column(4, function (Column $column) {
                    $column->append($this->moveMinutes());
                });

                $row->column(4, function (Column $column) {
                    $column->append($this->distance());
                });
            });

            $content->row(function (Row $row) {
                $row->column(6, function (Column $column) {
                    $column->append($this->speed());
                });

                $row->column(6, function (Column $column) {
                    $column->append($this->calory());
                });
            });

            $content->row(function (Row $row) {
                $row->column(6, function (Column $column) {
                    $column->append($this->heartRate());
                });

                $row->column(6, function (Column $column) {
                    $column->append($this->heartPoint());
                });
            });
        }

        return $content;
    }

    private function googleFitInitBtn()
    {
        $initUrl = "https://accounts.google.com/o/oauth2/v2/auth?prompt=consent&response_type=code";
        $initUrl .= "&client_id=".$this->google_client_id;
        $initUrl .= "&redirect_uri=".urlencode($this->google_redirect_uri);
        $initUrl .= "&access_type=offline";
        $initUrl .= "&scope=".$this->google_scope;

        $data['initUrl'] = $initUrl;

        return view('admin.dashboard.googleFitInitBtn', $data);
    }

    private function step()
    {
        return view('admin.charts.step', $this->fitData);
    }

    private function moveMinutes()
    {
        return view('admin.charts.moveMinutes', $this->fitData);
    }

    private function distance()
    {
        return view('admin.charts.distance', $this->fitData);
    }

    private function speed()
    {
        return view('admin.charts.speed', $this->fitData);
    }

    private function calory()
    {
        return view('admin.charts.calory', $this->fitData);
    }

    private function heartRate()
    {
        return view('admin.charts.heartRate', $this->fitData);
    }

    private function heartPoint()
    {
        return view('admin.charts.heartPoint', $this->fitData);
    }

    private function getGoogleToken($user)
    {
        # Refresh Token
        $url = "https://oauth2.googleapis.com/token?grant_type=refresh_token";
        $url .= "&client_id=".$this->google_client_id;
        $url .= "&client_secret=".$this->google_client_secret;
        $url .= "&refresh_token=".$user->google_fit_refresh_token;

        $apiResponse = Http::withHeaders([
            'content-type'=> 'application/x-www-form-urlencoded',
        ])->post($url);
        $responseJson = $apiResponse->json();

        if (!$apiResponse->ok() || !isset($responseJson['access_token']) || !$responseJson['access_token']) {
            $user->google_fit_refresh_token = null;
            $user->save();

            return null;
        }

        return $responseJson['access_token'];
    }

    private function getGoogleFitData($googleToken)
    {
        $datetime = new DateTime();
        $datetime->setTimezone(new DateTimeZone('Asia/Dhaka'));
        $datetime->sub(new DateInterval('P6D'));
        $startDate = $datetime->format('Y-m-d 00:00:00');
        $startDateTime = new DateTime($startDate, new DateTimeZone('Asia/Dhaka'));
        $startTimeMillis = $startDateTime->getTimestamp() * 1000;

        $endDateTime = new DateTime();
        $endTimeMillis = $endDateTime->getTimestamp() * 1000;

        $apiResponse = Http::withToken($googleToken
            )->post("https://www.googleapis.com/fitness/v1/users/me/dataset:aggregate", [
                "aggregateBy" => [
                    [
                        "dataTypeName" => "com.google.step_count.delta",
                        "dataSourceId" => "derived:com.google.step_count.delta:com.google.android.gms:estimated_steps",
                    ],
                    [
                        "dataTypeName" => "com.google.calories.expended",
                        "dataSourceId" => "derived:com.google.calories.expended:com.google.android.gms:merge_calories_expended",
                    ],
                    [
                        "dataTypeName" => "com.google.distance.delta",
                        "dataSourceId" => "derived:com.google.distance.delta:com.google.android.gms:merge_distance_delta",
                    ],
                    [
                        "dataTypeName" => "com.google.heart_rate.bpm",
                        "dataSourceId" => "derived:com.google.heart_rate.bpm:com.google.android.gms:merge_heart_rate_bpm",
                    ],
                    [
                        "dataTypeName" => "com.google.active_minutes",
                        "dataSourceId" => "derived:com.google.active_minutes:com.google.android.gms:merge_active_minutes",
                    ],
                    [
                        "dataTypeName" => "com.google.heart_minutes",
                        "dataSourceId" => "derived:com.google.heart_minutes:com.google.android.gms:merge_heart_minutes",
                    ],
                    [
                        "dataTypeName" => "com.google.speed",
                        "dataSourceId" => "derived:com.google.speed:com.google.android.gms:merge_speed",
                    ]
                ],
                "bucketByTime" => [
                    "durationMillis" => 86400000,
                ],
                "startTimeMillis" => $startTimeMillis,
                "endTimeMillis" => $endTimeMillis,
            ]);
        $responseJson = $apiResponse->json();

        # Day & Blank data initiate
        $days = [$datetime->format('D')];
        for ($i=0; $i <= 6; $i++) {
            if ($i != 0) {
                $datetime->add(new DateInterval('P1D'));
                $days[] = $datetime->format('D');
            }

            $steps[] = 0;
            $calories[] = 0;
            $distances[] = 0;
            $heart_rates_avg[] = 0;
            $heart_rates_max[] = 0;
            $heart_rates_min[] = 0;
            $move_minutes[] = 0;
            $heart_points[] = 0;
            $speeds_max[] = 0;
            $speeds_min[] = 0;
        }
        $data['days'] = $days;
        # ---

        if ($apiResponse->ok() && isset($responseJson['bucket'])) {
            foreach ($responseJson['bucket'] as $key=>$bucket) {
                $dataset = $bucket['dataset'];

                $stepData = $dataset[0];
                if ($stepData['point'])
                    $steps[$key] = $stepData['point'][0]['value'][0]['intVal'];

                $caloryData = $dataset[1];
                if ($caloryData['point'])
                    $calories[$key] = intVal(round($caloryData['point'][0]['value'][0]['fpVal']));

                $distanceData = $dataset[2];
                if ($distanceData['point'])
                    $distances[$key] = intVal(round($distanceData['point'][0]['value'][0]['fpVal']));

                $heartRateData = $dataset[3];
                if ($heartRateData['point']) {
                    $heart_rates_avg[$key] = intVal(round($heartRateData['point'][0]['value'][0]['fpVal']));
                    $heart_rates_max[$key] = intVal(round($heartRateData['point'][0]['value'][1]['fpVal']));
                    $heart_rates_min[$key] = intVal(round($heartRateData['point'][0]['value'][2]['fpVal']));
                }

                $activeMinuteData = $dataset[4];
                if ($activeMinuteData['point'])
                    $move_minutes[$key] = $activeMinuteData['point'][0]['value'][0]['intVal'];

                $heartMinuteData = $dataset[5];
                if ($heartMinuteData['point'])
                    $heart_points[$key] = $heartMinuteData['point'][0]['value'][1]['intVal'];

                $speedData = $dataset[6];
                if ($speedData['point']) {
                    $speeds_max[$key] = intVal(round($speedData['point'][0]['value'][1]['fpVal'] * 3600));
                    $speeds_min[$key] = intVal(round($speedData['point'][0]['value'][2]['fpVal'] * 3600));
                }
            }
        }

        $data['steps'] = $steps;
        $data['calories'] = $calories;
        $data['distances'] = $distances;
        $data['heart_rates_avg'] = $heart_rates_avg;
        $data['heart_rates_max'] = $heart_rates_max;
        $data['heart_rates_min'] = $heart_rates_min;
        $data['move_minutes'] = $move_minutes;
        $data['heart_points'] = $heart_points;
        $data['speeds_max'] = $speeds_max;
        $data['speeds_min'] = $speeds_min;

        $this->fitData = $data;
    }

    public function googleFitInitiate(Request $request)
    {
        $user = Auth::user();

        if (!$user->google_fit_refresh_token && $request->code) {
            # Token Generate
            $url = "https://oauth2.googleapis.com/token?grant_type=authorization_code";
            $url .= "&code=".$request->code;
            $url .= "&redirect_uri=".urlencode($this->google_redirect_uri);
            $url .= "&client_id=".$this->google_client_id;
            $url .= "&client_secret=".$this->google_client_secret;

            $apiResponse = Http::withHeaders([
                'content-type'=> 'application/x-www-form-urlencoded',
            ])->post($url);
            $responseJson = $apiResponse->json();

            if ($apiResponse->ok() && isset($responseJson['refresh_token']) && $responseJson['refresh_token']) {
                $user->google_fit_refresh_token = $responseJson['refresh_token'];
                $user->save();
            }
        }

        return redirect()->route(config('admin.route.prefix').'.home');
    }


    // motivation Quotes

    public function quotes()
    {
        try {
            $response = Http::withHeaders([
                'X-Api-Key' => 'H5eCGlzOo5lDB73CuEPVMA==5I3Zfj4xFhCVysz9'
            ])->get('https://api.api-ninjas.com/v1/quotes', [
                'category' => 'fitness'
            ]);

            $quote = "";
            if ($response->successful()) {
                $data = $response->json();
                $quote = $data[0]['quote'];
            }

            return $quote;
        } catch (\Throwable $th) {
            return "";
        }
    }

}
