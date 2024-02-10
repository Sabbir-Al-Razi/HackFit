<!-- notifications.blade.php -->
<li class="dropdown notifications-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-bell-o"></i>
        {{-- <span class="label label-warning">{{ $planOrders ? count($planOrders) : 0 }}</span> --}}
    </a>
    <ul class="dropdown-menu">
        {{-- <li class="header">You have <span class="label label-warning">{{ $planOrders ? count($planOrders) : 0 }}</span> notifications</li> --}}
        <li>
            <!-- Inner dropdown menu: contains the notifications -->
            <ul class="menu">
                <li>
                    <a href="#">
                        <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                </li>
                <!-- Add more notifications as needed -->
            </ul>
        </li>
        <li class="footer"><a href="#">View all</a></li>
    </ul>
</li>
