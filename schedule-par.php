<?php session_start();

include_once 'database.php';
if (!isset($_SESSION['user']) || $_SESSION['role'] != 'Parent') {
    header('Location:./logout.php');
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Schedule</title>
    <link rel="icon" href="../img/favicon2.png">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <?php include_once 'header.php'; ?>
</head>

<body class="nav-md">
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <?php include_once 'sidebar.php'; ?>
            </div>

            <?php include_once 'nav-menu.php'; ?>

            <div class="right_col" role="main">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>All <small>Children's Schedules</small></h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box table-responsive">
                                    <p class="text-muted font-13 m-b-30">School Management System</p>
                                    <table id="datatable-buttons" class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Student Name</th>
                                                <th>Subject</th>
                                                <th>Teacher</th>
                                                <th>Classroom</th>
                                                <th>Day</th>
                                                <th>Start Time</th>
                                                <th>End Time</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            // Lấy tất cả con của parent đang đăng nhập
                                            $sql = "SELECT sc.*,
                                                           CONCAT(s.fname, ' ', s.lname) as student_name,
                                                           sub.title as subject_name,
                                                           CONCAT(t.fname, ' ', t.lname) as teacher_name
                                                    FROM schedule sc
                                                    INNER JOIN student s ON s.classroom = sc.class
                                                    LEFT JOIN subject sub ON sub.sid = sc.subject
                                                    LEFT JOIN teacher t ON t.tid = sc.teacher
                                                    WHERE s.parent = '" . $_SESSION['uid'] . "'
                                                    ORDER BY s.fname, sc.day";

                                            $result = $conn->query($sql);

                                            if ($result->num_rows > 0) {
                                                while ($row = $result->fetch_assoc()) {
                                                    echo "<tr>
                                                            <td>" . $row["student_name"] . "</td>
                                                            <td>" . $row["subject_name"] . "</td>
                                                            <td>" . $row["teacher_name"] . "</td>
                                                            <td>" . $row["class"] . "</td>
                                                            <td>" . $row["day"] . "</td>
                                                            <td>" . $row["stime"] . "</td>
                                                            <td>" . $row["etime"] . "</td>
                                                          </tr>";
                                                }
                                            } else {
                                                echo "<tr><td colspan='7' class='text-center'>No schedules found</td></tr>";
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <div class="pull-right">
                Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
            </div>
            <div class="clearfix"></div>
        </footer>
    </div>
    </div>
    <?php include_once 'footer.php'; ?>

    <script type="text/javascript">
        $('.select2').select2();
    </script>
</body>
</html>