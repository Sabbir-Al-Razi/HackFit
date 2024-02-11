<div class="box">
    <div class="box-header">
        <h4 class="box-title">General Educations</h4>
    </div>
    <div class="box-body">
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Overview</th>
                        <th>Details</th>
                        <th>Home Care</th>
                        <th>Medicare</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($generalEducations as $education)
                        <tr>
                            <td>{{ $education->title }}</td>
                            <td>{{ Str::limit($education->overview, 50) }}</td>
                            <td>{{ Str::limit($education->details, 50) }}</td>
                            <td>{{ Str::limit($education->home_care, 50) }}</td>
                            <td>{{ Str::limit($education->medicare, 50) }}</td>
                            <td>
                                <button type="button" class="btn btn-primary view-details" data-title="{{ $education->title }}" data-overview="{{ $education->overview }}" data-details="{{ $education->details }}"  data-home_care="{{ $education->home_care }}"  data-medicare="{{ $education->medicare }}" data-toggle="modal" data-target="#detailsModal">
                                    View Details
                                </button>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal for displaying details -->
<div class="modal fade" id="detailsModal" tabindex="-1" role="dialog" aria-labelledby="detailsModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p><strong>Title:</strong> <span id="detailTitle"></span></p>
                <p><strong>Overview:</strong> <span id="detailOverview"></span></p>
                <p><strong>Details:</strong> <span id="detailDetails"></span></p>
                <p><strong>Homne Care:</strong> <span id="detailhome_care"></span></p>
                <p><strong>MediCare:</strong> <span id="detailmedicare"></span></p>
                <!-- Add more details as needed -->
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        var preventClose = false;

        $('.view-details').click(function() {
            var title = $(this).data('title');
            var overview = $(this).data('overview');
            var details = $(this).data('details');
            var home_care = $(this).data('home_care');
            var medicare = $(this).data('medicare');

            $('#detailTitle').text(title);
            $('#detailOverview').text(overview);
            $('#detailDetails').text(details);
            $('#detailhome_care').text(home_care);
            $('#detailmedicare').text(medicare);
            $('#detailsModal').modal('show');

            // Reset preventClose flag to false when modal is opened
            preventClose = true;
        });

        $('#detailsModal').on('hide.bs.modal', function (e) {
            if (preventClose) {
                e.preventDefault();
            }
        });

        // Handler for closing modal manually
        $('.close').click(function() {
            preventClose = false; // Allow modal to close
            $('#detailsModal').modal('hide');
        });

        // Handler for modal backdrop click
        $('#detailsModal').click(function (e) {
            if ($(e.target).hasClass('modal')) {
                preventClose = false; // Allow modal to close
            }
        });
    });
</script>



