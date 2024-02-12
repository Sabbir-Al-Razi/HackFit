<style>
    .bg-info {
        background-color: #17a2b8 !important;
    }
    .bg-info, .bg-info > a {
        color: #fff !important;
    }
    .bg-success {
        background-color: #28a745 !important;
    }
    .bg-success, .bg-success > a
    {
        color: #fff !important;
    }
    .bg-warning {
        background-color: #ffc107 !important;
    }
    .bg-warning, .bg-warning > a {
        color: #1f2d3d !important;
    }
    .bg-danger
    {
        background-color: #dc3545 !important;
    }
    .bg-danger, .bg-danger > a {
        color: #fff !important;
    }

    .small-box {
        border-radius: .25rem;
        box-shadow: 0 0 1px rgba(0,0,0,.125),0 1px 3px rgba(0,0,0,.2);
        display: block;
        margin-bottom: 20px;
        position: relative;
    }
    .small-box > .inner {
        padding: 10px;
    }
    .small-box .icon {
        color: rgba(0,0,0,.15);
        z-index: 0;
    }
</style>

<div class="row">
    <div class="col-lg-3 col-6">
        <div class="small-box bg-info">
            <div class="inner">
                <h3>{{$today_steps}}<span style="font-size: 15px;font-weight: 400; padding-left: 5px;">{{$today_steps>1?'Steps':'Step'}}</span></h3>
                <p>Today's Walking</p>
            </div>
            <div class="icon">
                <i class="ion ion-android-walk"></i>
            </div>
            <span class="small-box-footer"></span>
        </div>
    </div>

    <div class="col-lg-3 col-6">
        <div class="small-box bg-success">
            <div class="inner">
                <h3>{{$today_move_minutes}}<span style="font-size: 15px;font-weight: 400; padding-left: 5px;">{{$today_move_minutes>1?'Minutes':'Minute'}}</span></h3>
                <p>Today's Move Duration</p>
            </div>
            <div class="icon">
                <i class="ion ion-android-alarm-clock"></i>
            </div>
            <span class="small-box-footer"></span>
        </div>
    </div>

    <div class="col-lg-3 col-6">
        <div class="small-box bg-warning">
            <div class="inner">
                <h3>{{$today_distances}}<span style="font-size: 15px;font-weight: 400; padding-left: 5px;">{{$today_distances>1?'Meters':'Meter'}}</span></h3>
                <p>Today's Distance</p>
            </div>
            <div class="icon">
                <i class="ion ion-earth"></i>
            </div>
            <span class="small-box-footer"></span>
        </div>
    </div>

    <div class="col-lg-3 col-6">
        <div class="small-box bg-danger">
            <div class="inner">
                <h3>{{$today_calories}}<span style="font-size: 15px;font-weight: 400; padding-left: 5px;">{{$today_calories>1?'Calories':'Calory'}}</span></h3>
                <p>Today's Expended Energy</p>
            </div>
            <div class="icon">
                <i class="ion ion-ios-body"></i>
            </div>
            <span class="small-box-footer"></span>
        </div>
    </div>

</div>
