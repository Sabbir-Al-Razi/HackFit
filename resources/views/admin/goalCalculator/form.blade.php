<style>
    table.cinfoT{border-collapse:collapse;border-spacing:0;margin-top:0;}
    table.cinfoT th, table.cinfoT td.cinfoHd, table.cinfoT td.cinfoHdL{border-top:1px solid #114477;border-left:1px solid #114477;border-right:1px solid #114477;border-bottom:1px solid #336699;background-color:#336699;font-weight:bold;color:#fff;padding: 5px 3px;}
    table.cinfoT td{border:1px solid #ccc;color:#000;padding:3px;}
    table.cinfoT tr:nth-child(odd) {background-color: #eee;}
    table.cinfoT tr:nth-child(even) {background-color: #fff;}
    table.cinfoTS td.cinfoHd{font-size:13px;}
    table.cinfoTS td.cinfoHdL{font-size:13px;}
    table.cinfoTS td{font-size:13px;padding:3px 1px;}
</style>

<div class="box box-info" style="min-height: 410px;">
    <div class="box-header with-border">
        <h3 class="box-title">Goal Calculator</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
    </div>
    <!-- /.box-header -->

    <form action="{{route(config('admin.route.prefix').'.goalCalculate')}}" method="post" class="form-horizontal">
        @csrf
        <div class="box-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="fields-group">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="height_feet" class="col-sm-2 control-label">Height</label>
                                <div class="col-sm-9">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <div class="input-group">
                                                <input type="number" id="height_feet" name="height_feet" class="form-control" require="" value="{{$inputData['height_feet']??''}}">
                                                <span class="input-group-addon">feet</span>
                                            </div>
                                        </div>
                                        <div class="col-xs-6" style="padding-left: 0;">
                                            <div class="input-group">
                                                <input type="number" id="height_inches" name="height_inches" class="form-control" require="" value="{{$inputData['height_inches']??''}}">
                                                <span class="input-group-addon">inches</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="weight" class="col-sm-2 control-label">Current Weight(Kg)</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input type="number" id="weight" name="weight" class="form-control" require="" value="{{$inputData['weight']??''}}">
                                        <span class="input-group-addon">kg</span>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="weight" class="col-sm-2 control-label">Age</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input type="number" id="age" name="age" class="form-control" require="" value="{{$inputData['age']??''}}">
                                        <span class="input-group-addon">Years</span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="weight" class="col-sm-2 control-label">Target Weight (Kg)</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input type="number" id="target_weight" name="target_weight" class="form-control" require="" value="{{$inputData['target_weight']??''}}">
                                        <span class="input-group-addon">Kg</span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="weight" class="col-sm-2 control-label">Timeframe (in weeks)</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input type="number" id="timeframe" name="timeframe" class="form-control" require="" value="{{$inputData['timeframe']??''}}">
                                        <span class="input-group-addon">Weeks</span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="weight" class="col-sm-2 control-label">Activity</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <select name="activity_level" id="activity_level" class="form-control">
                                            <option value="sedentary" {!! (@$inputData['activity_level'] == "sedentary") ? "selected" : "" !!}>Sedentary</option>
                                            <option value="lightly_active" {!! (@$inputData['activity_level'] == "lightly_active") ? "selected" : "" !!}>Lightly Active</option>
                                            <option value="moderately_active" {!! (@$inputData['activity_level'] == "moderately_active") ? "selected" : "" !!}>Moderately Active</option>
                                            <option value="very_active" {!! (@$inputData['activity_level'] == "very_active") ? "selected" : "" !!}>Very Active</option>
                                          </select>
                                        <span class="input-group-addon">Activity</span>
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


            </div>

        </div>
        <!-- /.box-body -->
    </form>
</div>
