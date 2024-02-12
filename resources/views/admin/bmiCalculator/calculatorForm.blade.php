<div class="box box-info">
    <div class="box-header with-border">
        <h3 class="box-title">Calculator</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
    </div>
    <!-- /.box-header -->

    <form action="{{route(config('admin.route.prefix').'.bmiCalculate')}}" method="post" class="form-horizontal">
        @csrf
        <div class="box-body">
            <div class="fields-group">

                <div class="col-md-12">
                    <div class="form-group">
                        <label for="height_feet" class="col-sm-2 control-label">Height</label>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="input-group">
                                        <input type="number" id="height_feet" name="height_feet" class="form-control" require="">
                                        <span class="input-group-addon">feet</span>
                                    </div>
                                </div>
                                <div class="col-xs-6" style="padding-left: 0;">
                                    <div class="input-group">
                                        <input type="number" id="height_inches" name="height_inches" class="form-control" require="">
                                        <span class="input-group-addon">inches</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="weight" class="col-sm-2 control-label">Weight</label>
                        <div class="col-sm-9">
                            <div class="input-group">
                                <input type="number" id="weight" name="weight" class="form-control" require="">
                                <span class="input-group-addon">kg</span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-9">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-calculator"></i> Calculate</button>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- /.box-body -->
    </form>
</div>
