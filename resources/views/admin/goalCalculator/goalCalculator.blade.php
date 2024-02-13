<div class="box box-info" style="min-height: 410px;">
    <div class="box-header with-border">
        <h3 class="box-title">Result</h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
    </div>

    <!-- /.box-header -->
    <div class="box-body">
        <div class="col-md-12">
            <div class="row justify-content-center">
                <div class="card">
                    <h3 class="card-header text-center">Your Target</h3>
                    <hr>
                    <div class="card-body">
                        <p><strong>Basal Metabolic Rate (BMR):</strong> {{ number_format(@$bmr,2,'.') }} calories/day</p>
                        <p><strong>Total Daily Energy Expenditure (TDEE):</strong> {!! number_format(@$tdee,2,'.') !!} calories/day</p>
                        <p><strong>Target Weight:</strong> {!! @$target_weight !!} kg</p>
                        <p><strong>Target Calories:</strong> {!! number_format(@$target_calories,2,'.') !!} calories/day</p>
                        <p><strong>Target Timeframe:</strong> {{ @$timeframe }} weeks</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.box-body -->
</div>
