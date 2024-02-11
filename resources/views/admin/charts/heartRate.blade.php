<div class="box box-default">
    <div class="box-header with-border">
        <h3 class="box-title">Heart Rate</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
    </div>

    <!-- /.box-header -->
    <div class="box-body">
        <div class="table-responsive">
            <table class="table table-striped">
                <canvas id="heartRateChart"></canvas>
            </table>
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.box-body -->
</div>

<script>
$(function () {
    var ctx = document.getElementById("heartRateChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["{!!implode('", "', $days)!!}"],
            datasets: [
                {
                    label: 'Max Heart Rate (bpm)',
                    data: [{{implode(', ', $heart_rates_max)}}],
                    backgroundColor: [
                        'rgba(220,20,60, 0.2)'
                    ],
                    borderColor: [
                        'rgba(220,20,60, 1)'
                    ],
                    borderWidth: 1
                },
                {
                    label: 'Avg Heart Rate (bpm)',
                    data: [{{implode(', ', $heart_rates_avg)}}],
                    backgroundColor: [
                        'rgba(95, 158, 160, 0.2)'
                    ],
                    borderColor: [
                        'rgba(95, 158, 160, 1)'
                    ],
                    borderWidth: 1
                },
                {
                    label: 'Min Heart Rate (bpm)',
                    data: [{{implode(', ', $heart_rates_min)}}],
                    backgroundColor: [
                        'rgba(128,128,0, 0.2)'
                    ],
                    borderColor: [
                        'rgba(128,128,0, 1)'
                    ],
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
});
</script>
