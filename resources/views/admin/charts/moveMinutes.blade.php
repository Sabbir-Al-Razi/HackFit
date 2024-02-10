<div class="box box-default">
    <div class="box-header with-border">
        <h3 class="box-title">Move Minutes</h3>

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
                <canvas id="moveMinutesChart"></canvas>
            </table>
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.box-body -->
</div>

<script>
$(function () {
    var ctx = document.getElementById("moveMinutesChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["{!!implode('", "', $days)!!}"],
            datasets: [{
                label: 'Minutes',
                data: [{{implode(', ', $move_minutes)}}],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)'
                ],
                borderWidth: 1
            }]
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
