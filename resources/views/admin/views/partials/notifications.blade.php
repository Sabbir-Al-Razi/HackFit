<style>
    .modal-backdrop {
        position: relative !important;
    }
</style>

<li class="dropdown notifications-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-bell-o"></i>
        <span class="label label-warning">{{ $planOrders ? count($planOrders) : 0 }}</span>
    </a>
    <ul class="dropdown-menu">
        <li class="header">You have <span class="label label-warning">{{ $planOrders ? count($planOrders) : 0 }}</span> notifications</li>
        <li>
            <!-- Inner dropdown menu: contains the notifications -->
            <ul class="menu">
                @foreach($planOrders as $planOrder)
                    <li>
                        <a href="#" class="notification-item" data-toggle="modal" data-target="#planOrderModal{{$planOrder->id}}">
                            <i class="fa fa-users text-aqua"></i> {{ $planOrder->plan_name }}
                        </a>
                    </li>
                @endforeach
            </ul>
        </li>
        <li class="footer"><a href="{{ url('/admin/plan-order') }}">View all</a></li>
    </ul>
</li>
<!-- Modals for displaying plan order details -->
@foreach($planOrders as $planOrder)
<div class="modal fade" id="planOrderModal{{$planOrder->id}}" tabindex="-1" role="dialog" aria-labelledby="planOrderModal{{$planOrder->id}}Label" aria-hidden="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>{!! str_replace('||', '<br>', $planOrder->description) !!}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
@endforeach

