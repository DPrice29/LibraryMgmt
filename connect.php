<?php
	$reservationStatuts = $_POST['reservationStatus'];
	$category = $_POST['category'];
	$book = $_POST['book'];
	$author = $_POST['author'];
	$bookAuthor = $_POST['bookAuthor'];
	$memberStatus = $_POST['memberStatus'];
    $member = $_POST['member'];
	$reservation = $_POST['reservation'];
	$finePayment = $_POST['finePayment'];
	$loan = $_POST['loan'];
	$fine = $_POST['fine'];

	// Database connection
	$conn = new mysqli('localhost','root','','test');
	if($conn->connect_error){
		echo "$conn->connect_error";
		die("Connection Failed : ". $conn->connect_error);
	} else {
		$stmt = $conn->prepare("insert into library(reservationStatus, category, book, author, bookAuthor, memberStatus, member, reservation, finePayment, loan, fine) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		$stmt->bind_param("iiiiiiiiiii", $reservationStatus, $category, $book, $author, $bookAuthor, $memberStatus, $member, $reservation, $finePayment, $loan, $loan);
		$execval = $stmt->execute();
		echo $execval;
		echo "Library successfully...";
		$stmt->close();
		$conn->close();
	}
?> 