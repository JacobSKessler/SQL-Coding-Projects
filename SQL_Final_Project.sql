create database db_libraryManagementSystem;
/*Tables populated with same date data so that might need to be changed or different data used to check work*/
create table tbl_Library_Branch (
BranchID int primary key not null identity (1,1),
BranchName varchar (30) not null,
Address varchar (50) not null
);

create table tbl_Publisher (
PublisherName varchar (50) primary key not null,
Address varchar (50) not null,
Phone varchar (20)
);

create table tbl_Books (
BookID int primary key not null identity (1,1), 
Title varchar (1200) not null, /* world record book is just under 12000 characters but I'm not sure how to store that reasonably*/
PublisherName varchar (50) foreign key references tbl_Publisher(PublisherName)
);

create table tbl_Book_Authors (
BookID int foreign key references tbl_Books(BookID) identity (1,1),
AuthorName varchar (50)
);

create table tbl_Borrower (
CardNo int primary key not null identity (1,1), /* each book only has one ID so incramental refrence makes sense to me here*/
Name varchar (30) not null,
Address varchar (50) not null,
Phone varchar (20) not null
);

create table tbl_Book_Copies (
BookID int foreign key references tbl_Books(BookID),
BranchID int foreign key references tbl_Library_Branch(BranchID),
Number_Of_Copies int not null /* it seems like it would be better to initalize this to 0 and have a procedure to add or remove books from the total, but I'mnot sure how to do that */
);

create table tbl_Book_Loans (
BookID int foreign key references tbl_Books(BookID),
BranchID int foreign key references tbl_Library_Branch(BranchID),
CardNo int foreign key references tbl_Borrower(CardNo),
DateOut date not null,
DateDue date not null
);

insert into tbl_Library_Branch (BranchName, Address)
values
('Sharpstown', 'Sharpstown, CA'),
('Central', 'Central, OR'),
('South', 'South, NY'),
('North', 'North, CA')
;

insert into tbl_Publisher (PublisherName, Address, Phone)
values
('Star', 'Austian, TX', '123xxxxxxx'),
('Dipper', 'Portland, OR', '789xxxxxxx')
;

insert into tbl_Books (Title, PublisherName)
values
('The Lost Tribe', 'Star'),
('IT', 'Star'),
('The Shining', 'Star'),
('Book4', 'Star'),
('Book5', 'Star'),
('Book6', 'Star'),
('Book7', 'Star'),
('Book8', 'Star'),
('Book9', 'Star'),
('Book10', 'Star'),
('Book11', 'Star'),
('Book12', 'Dipper'),
('Book13', 'Dipper'),
('Book14', 'Dipper'),
('Book15', 'Dipper'),
('Book16', 'Dipper'),
('Book17', 'Dipper'),
('Book18', 'Dipper'),
('Book19', 'Dipper'),
('Book20', 'Dipper'),
('Book21', 'Dipper')
;

insert into tbl_Book_Authors (AuthorName)
values
('stan'),
('Stephen King'),
('Stephen King'),
('stan'),
('stan'),
('stan'),
('stan'),
('Jon'),
('Jon'),
('stan'),
('stan'),
('Erica'),
('Erica'),
('Alan'),
('Jack'),
('Bill'),
('Frost'),
('Zeke'),
('Ben'),
('stan'),
('stan')
;

insert into tbl_Book_Copies (BookID, BranchID, Number_Of_Copies)
values
(1,1,2),
(1,2,2),
(2,1,2),
(2,2,3),
(3,2,3),
(3,1,2),
(4,1,2),
(5,1,2),
(6,1,2),
(7,1,2),
(8,1,2),
(9,1,2),
(10,1,2),
(4,2,2),
(5,2,2),
(6,2,2),
(7,2,2),
(8,2,2),
(9,2,2),
(10,2,2),
(11,2,2),
(12,2,2),
(6,3,2),
(7,3,2),
(8,3,2),
(9,3,2),
(10,3,2),
(11,3,2),
(12,3,2),
(13,3,2),
(14,3,2),
(15,3,2),
(10,4,2),
(11,4,2),
(12,4,2),
(13,4,2),
(14,4,2),
(15,4,2),
(16,4,2),
(17,4,2),
(18,4,2),
(19,4,5),
(20,4,2),
(21,4,2)
;

insert into tbl_Borrower (Name, Address, Phone)
values
('Babs','mega drive','234xxxxxxx'),
('Percy','alpha lane','456xxxxxxx'),
('Harry','oak crt','567xxxxxxx'),
('Lacy','pine way','678xxxxxxx'),
('Steve','prayer drive','789xxxxxxx'),
('Mack','hfil','891xxxxxxx'),
('Mann','the moon','912xxxxxxx'),
('Ghost','behind you','321xxxxxxx')
;

/*At recomendation from instructor all books contained in this table are considered checked out and if past due checked out and late*/
insert into tbl_Book_Loans (BookID, BranchID, CardNo, DateOut, DateDue)
values/* date format YYYY-MM-DD*/
(1,1,1,'2019-08-05','2019-08-12'),
(2,1,1,'2019-08-05','2019-08-12'),
(3,1,1,'2019-08-05','2019-08-12'),
(4,1,1,'2019-08-05','2019-08-12'),
(5,1,1,'2019-08-05','2019-08-12'),
(6,1,1,'2019-08-05','2019-08-12'),
(7,1,1,'2019-08-05','2019-08-12'),
(8,1,1,'2019-08-05','2019-08-12'),
(9,1,1,'2019-08-05','2019-08-12'),
(10,1,1,'2019-08-05','2019-08-12'),
(2,2,2,'2019-08-05','2019-08-12'),
(3,2,2,'2019-08-05','2019-08-12'),
(4,2,2,'2019-08-05','2019-08-12'),
(5,2,2,'2019-08-05','2019-08-12'),
(6,2,2,'2019-08-05','2019-08-12'),
(7,2,2,'2019-08-05','2019-08-12'),
(8,2,2,'2019-08-05','2019-08-12'),
(9,2,2,'2019-08-05','2019-08-12'),
(10,2,2,'2019-08-05','2019-08-12'),
(11,2,2,'2019-08-05','2019-08-12'),
(6,3,3,'2019-08-05','2019-08-12'),
(7,3,3,'2019-08-05','2019-08-12'),
(8,3,3,'2019-08-05','2019-08-12'),
(9,3,3,'2019-08-05','2019-08-12'),
(10,3,3,'2019-08-05','2019-08-12'),
(11,3,4,'2019-08-05','2019-08-12'),
(12,3,4,'2019-08-05','2019-08-12'),
(13,3,4,'2019-08-05','2019-08-12'),
(14,3,4,'2019-08-05','2019-08-12'),
(15,3,4,'2019-08-05','2019-08-12'),
(10,4,5,'2019-08-05','2019-08-12'),
(11,4,5,'2019-08-05','2019-08-12'),
(12,4,5,'2019-08-05','2019-08-12'),
(13,4,5,'2019-08-05','2019-08-12'),
(14,4,5,'2019-08-05','2019-08-12'),
(15,4,6,'2019-08-05','2019-08-12'),
(16,4,6,'2019-08-05','2019-08-12'),
(17,4,6,'2019-08-05','2019-08-12'),
(18,4,6,'2019-08-05','2019-08-12'),
(19,4,6,'2019-08-05','2019-08-12'),
(1,1,7,'2019-08-05','2019-08-12'),
(2,1,7,'2019-08-05','2019-08-12'),
(3,1,7,'2019-08-05','2019-08-12'),
(4,1,7,'2019-08-05','2019-08-12'),
(5,1,7,'2019-08-05','2019-08-12'),
(6,2,8,'2019-08-05','2019-08-12'),
(7,2,8,'2019-08-05','2019-08-12'),
(8,2,8,'2019-08-05','2019-08-12'),
(9,2,8,'2019-08-05','2019-08-12'),
(10,2,8,'2019-08-05','2019-08-12')
;


/*1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/
select tbl_Book_Copies.Number_Of_Copies, tbl_Books.Title, tbl_Library_Branch.BranchName from tbl_Book_Copies
inner join tbl_Books on tbl_Book_Copies.BookID = tbl_Books.BookID
inner join tbl_Library_Branch on tbl_Book_Copies.BranchID = tbl_Library_Branch.BranchID
where tbl_Books.Title = 'The Lost Tribe'
and tbl_Library_Branch.BranchName = 'Sharpstown'
;

/*2.How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/
select tbl_Book_Copies.Number_Of_Copies, tbl_Books.Title, tbl_Library_Branch.BranchName from tbl_Book_Copies
inner join tbl_Books on tbl_Book_Copies.BookID = tbl_Books.BookID
inner join tbl_Library_Branch on tbl_Book_Copies.BranchID = tbl_Library_Branch.BranchID
where tbl_Books.Title = 'The Lost Tribe'
;

/*3.Retrieve the names of all borrowers who do not have any books checked out.*/
select * from tbl_Book_Loans
inner join tbl_Borrower on tbl_Borrower.CardNo = tbl_Book_Loans.CardNo 
where DateOut = null
;

/*4.For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.*/
select tbl_Books.Title, tbl_Borrower.Name, tbl_Borrower.Address from tbl_Borrower
inner join tbl_Book_Loans on tbl_Borrower.CardNo = tbl_Book_Loans.CardNo
inner join tbl_Books on tbl_Book_Loans.BookID = tbl_Books.BookID
inner join tbl_Library_Branch on tbl_Book_Loans.BranchID = tbl_Library_Branch.BranchID
where tbl_Book_Loans.DateDue = format(GETDATE(), 'yyyy-MM-dd') and tbl_Library_Branch.BranchName = 'Sharpstown'
;

/*5.For each library branch, retrieve the branch name and the total number of books loaned out from that branch*/
select tbl_Library_Branch.BranchName, count(tbl_Book_Loans.DateDue) from tbl_Library_Branch
inner join tbl_Book_Loans on tbl_Book_Loans.BranchID = tbl_Library_Branch.BranchID
group by tbl_Library_Branch.BranchName
;

/*6.Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.*/
select tbl_Borrower.Name, tbl_Borrower.Address, count(tbl_Book_Loans.BookID) from tbl_Borrower
inner join tbl_Book_Loans on tbl_Borrower.CardNo = tbl_Book_Loans.CardNo
group by tbl_Borrower.Name, tbl_Borrower.Address
having count(*)>5
;

/*7.For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/
select tbl_Books.Title, tbl_Book_Copies.Number_Of_Copies, tbl_Library_Branch.BranchName from tbl_Books
full outer join tbl_Book_Copies on tbl_Books.BookID = tbl_Book_Copies.BookID
full outer join tbl_Book_Authors on tbl_Book_Authors.BookID = tbl_Books.BookID
full outer join tbl_Library_Branch on tbl_Book_Copies.BranchID = tbl_Library_Branch.BranchID
where tbl_Library_Branch.BranchName = 'Central'
and tbl_Book_Authors.AuthorName = 'Stephen King'
;