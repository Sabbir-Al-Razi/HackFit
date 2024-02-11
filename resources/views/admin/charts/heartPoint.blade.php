<div class="box box-default">
    <div class="box-header with-border">
        <h3 class="box-title">Heart Points</h3>

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
                <canvas id="heartPointChart"></canvas>
            </table>
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.box-body -->
</div>

<script>
$(function () {
    var ctx = document.getElementById("heartPointChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["{!!implode('", "', $days)!!}"],
            datasets: [
                {
                    label: 'Heart Points (pts)',
                    data: [{{implode(', ', $heart_points)}}],
                    fill: false,
                    borderColor: 'rgb(34,139,34)',
                    tension: 0.1
                }
            ]
        }
    });
});
</script>
