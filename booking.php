<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Ticket</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <nav>
        <h2>Uniport</h2>

        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="search.php">Search Bus</a></li>
            <li><a href="booking.php">Book Ticket</a></li>
        </ul>
    </nav>

    <div class="container">

        <h1>Book Your Ticket</h1>

        <form class="form-box" action="save_booking.php" method="POST">

            <label>Name</label>
            <input type="text" name="name" placeholder="Enter Name">

            <label>Phone</label>
            <input type="text" name="phone" placeholder="01XXXXXXXXX">

            <label>Seat Number</label>
            <input type="text" name="seat" placeholder="A1">

            <button>Confirm Booking</button>

        </div>

</form>

</body>
</html>