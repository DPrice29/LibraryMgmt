CREATE DATABASE Library;

CREATE TABLE ReservationStatus (
  id INT,
  status_value VARCHAR(50),
  CONSTRAINT pk_res_status PRIMARY KEY (id)
);

CREATE TABLE Category (
  id INT,
  category_name VARCHAR(100),
  CONSTRAINT pk_category PRIMARY KEY (id)
  );

CREATE TABLE Book (
  id INT,
  title VARCHAR(500),
  category_id INT,
  publication_date DATE,
  copies_owned INT,
  CONSTRAINT pk_book PRIMARY KEY (id),
  CONSTRAINT fk_book_category FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE Author (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  CONSTRAINT pk_author PRIMARY KEY (id)
);

CREATE TABLE BookAuthor (
  book_id INT,
  author_id INT,
  CONSTRAINT fk_bookauthor_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_bookauthor_author FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE MemberStatus (
  id INT,
  status_value VARCHAR(50),
  CONSTRAINT pk_memberstatus PRIMARY KEY (id),
);

CREATE TABLE Member (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  joined_date DATE,
  active_status_id INT,
  CONSTRAINT pk_member PRIMARY KEY (id),
  CONSTRAINT fk_member_status FOREIGN KEY (active_status_id) REFERENCES member_status(id)
);

CREATE TABLE Reservation (
  id INT,
  book_id INT,
  member_id INT,
  reservation_date DATE,
  reservation_status_id INT,
  CONSTRAINT pk_reservation PRIMARY KEY (id),
  CONSTRAINT fk_res_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_res_member FOREIGN KEY (member_id) REFERENCES member(id)
);


CREATE TABLE FinePayment (
  id INT,
  member_id INT,
  payment_date DATE,
  payment_amount INT,
  CONSTRAINT pk_fine_payment PRIMARY KEY (id),
  CONSTRAINT fk_finepay_member FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE Loan (
  id INT,
  book_id INT,
  member_id INT,
  loan_date DATE,
  returned_date DATE,
  CONSTRAINT pk_loan PRIMARY KEY (id),
  CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES member(id)
);


CREATE TABLE Fine (
  id INT,
  book_id INT,
  loan_id INT,
  fine_date DATE,
  fine_amount INT,
  CONSTRAINT pk_fine PRIMARY KEY (id),
  CONSTRAINT fk_fine_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_fine_loan FOREIGN KEY (loan_id) REFERENCES loan(id));
  
DESCRIBE ReservationStatus;
DESCRIBE Category;
DESCRIBE Book;
DESCRIBE Author;
DESCRIBE BookAuthor;
DESCRIBE MemberStatus;
DESCRIBE Member;
DESCRIBE Reservation;
DESCRIBE FinePayment;
DESCRIBE Loan;
DESCRIBE Fine;

-- Insert Values into Tables --
INSERT INTO ReservationStatus(id, status_value)
	VALUES('50', '8')
	
INSERT INTO Category(id, category_name)
	VALUES('25', 'Self Help')
	      ('30', 'US History')
		  ('35', 'Fiction')
		  ('40', 'Nom-Fiction');
		  
INSERT INTO Book(id, title, category_id, publication_date, copies_owned )
	VALUES('0735211299', 'Atomic Habits' , 'Self Help', '2018-10-16', '1')
		  ('1400096794', 'The Nine', 'US History', '2008-09-09', '1')
		  ('1400033416', 'Beloved', 'Fiction', '2004-06-08', '1')
		  ('0063037327', 'Finding Me: A Memoir', 'Non-Fiction', '2022-04-26', '1')
		  ('0307278441', 'The Bluest Eye', 'Fiction', '2007-05-08', '1');
		  
INSERT INTO Author(id, first_name, last_name)
	VALUES('2', 'James', 'Clear')
	      ('3', 'Jeffery', 'Toobin')
		  ('4', 'Toni', 'Morrison')
		  ('5', 'Viola', 'Davis');
		  
INSERT INTO Book_author(book_id, author_id)
	VALUES('0735211299', '2')
	      ('1400096794', '3')
		  ('1400033416', '4')
		  ('0063037327', '5')
		  ('0307278441', '4');
		  
INSERT INTO MemberStatus(id, status_value)
	VALUES('950205836286000', '2')
	      ('950884308347000', '2')
		  ('950723948541000', '2')
		  ('950310543875000', '1');

INSERT INTO Member(id, first_name, last_name, joined_date, active_status_id)
	VALUES('950205836286000', 'Dakota', 'Price', '2017-04-01', '2')
	      ('950884308347000', 'Jeremiah', 'Horton', '2017-04-01', '2')
		  ('950723948541000', 'Jalen', 'Shine', '2017-04-01', '2')
		  ('950310543875000', 'Terrel', 'Rodgers', '2017-04-01', '1');
		  
INSERT INTO Reservation(id, book_id, member_id, reservation_data, reservation_status_id)
	VALUES('50', '1400033416', '950205836286000', '2022-05-20', '8')
	      ('60', '0735211299', '950884308347000', '2022-05-23', '10');
		  
INSERT INTO FinePayment(id, member_id, payment_date, payment_amount)
	VALUES('230', '950723948541000', '2022-04-01', '230');
	
INSERT INTO Loan(id, book_1d, member_id, loan_date, returned_date)
	VALUES('43', '0307278441', '950723948541000', '2020-03-16','2022-04-01')
	
INSERT INTO Fine(id, book_id, loan_id, fine_date, fine_amount)
	VALUES('230', '0307278441', '43', '2022-05-16', '230');
