/* Project */
/* ## MS-SQL PROJECT on Bank Database Design by Shalu Eluvelil Vavakunju ! */

-- PHASE I of project begins 

--Q1. Create a database for a banking application called 'Bank'. 
--------------------------------------
/*Create Database*/
---------------------------------------
create database dbBankProject_Shalu;

/* NOTE: Unlike asked in question database name has been used as 'dbBankProject_Shalu' instead of 'Bank' in order to make it unique 
from other students. Following code is used to select 'dbBankProject_Shalu' as current database */

use dbBankProject_Shalu;

--Q2. Create all the tables mentioned in the database diagram. 
--Q3. Create all the constraints based on the database diagram. 

--NOTE: Solution to questions 2 and 3 are provided at once as follows.

/* CREATE TABLE & ADD CONSTRAINTS Section */

--Create table UserLogins

create table tbl_UserLogins      
(UserLoginID smallint Not null primary key , 
 UserLogin  char(15) not null,
 UserPassword varchar(20) not null);

 select * from tbl_UserLogins


 --Create table UserSecurityQuestions

 create table tbl_UserSecurityQuestions      
(UserSecurityQuestionID tinyint Not null primary key , 
 UserSecurityQuestion  varchar(50) not null);

 select * from tbl_UserSecurityQuestions

 --create table UserSecurityAnswers

 create table tbl_UserSecurityAnswers
 (UserLoginID smallint primary key foreign key references tbl_UserLogins(UserLoginID),
 UserSecurityQuestionAnswer varchar(25) not null,
UserSecurityQuestionID tinyint foreign key references tbl_UserSecurityQuestions(UserSecurityQuestionID));

select * from tbl_UserSecurityAnswers

--create table Employee

create table tbl_Employee
(EmployeeID int Not null primary key,
EmployeeFirstName varchar(25),
EmployeeMiddleInitial char(1),
EmployeeLastName varchar(25),
EmployeeIsManager bit);

select * from tbl_Employee

--create table tbl_TransactionType

create table tbl_TransactionType
(TransactionTypeID tinyint Not null primary key,
TransactionTypeName char(10),
TransactionTypeDescription varchar(50),
TransactionFeeAmount smallmoney);

select * from tbl_TransactionType

--create table LoginErrorLog

create table tbl_LoginErrorLog
(ErrorLogID int Not null primary key,
ErrorTime Datetime,
FailedTransactionXML xml);

select * from tbl_LoginErrorLog

--create table FailedTransactionErrorType

create table tbl_FailedTransactionErrorType
(FailedTransactionErrorTypeID tinyint Not null primary key,
FailedTransactionDescription varchar(50))

select * from tbl_FailedTransactionErrorType

--create table FailedTransactionLog

create table tbl_FailedTransactionLog
(FailedTransactionID int not null primary key,
FailedTransactionErrorTypeID tinyint foreign key references tbl_FailedTransactionErrorType(FailedTransactionErrorTypeID),
FailedTransactionErrorTime datetime,
FailedTransactionXML xml)

select * from tbl_FailedTransactionLog

--create table AccountStatusType

create table tbl_AccountStatusType
(AccountStatusTypeID tinyint not null primary key,
AccountStatusDescription varchar(30))

select * from tbl_AccountStatusType

--create table AccountType

create table tbl_AccountType
(AccountTypeID tinyint not null primary key,
AccountTypeDescription varchar(30)
)

select * from tbl_AccountType

--create table SavingsInterestRates

create table tbl_SavingsInterestRates
(InterestSavingsRateID tinyint not null primary key,
InterestRateValue numeric(9,9),
InterestRateDescription varchar(20))

select * from tbl_SavingsInterestRates

--create table Account

create table tbl_Account
(AccountID int not null primary key,
CurrentBalance int,
AccountTypeID tinyint foreign key references tbl_AccountType(AccountTypeID),
AccountStatusTypeID tinyint foreign key references tbl_AccountStatusType(AccountStatusTypeID),
InterestSavingsRateID tinyint foreign key references tbl_SavingsInterestRates(InterestSavingsRateID)
)

select * from tbl_Account

--create table OverDraftLog

create table tbl_OverDraftLog
(AccountID int primary key foreign key references tbl_Account(AccountID),
OverDraftDate datetime,
OverDraftAmount money,
OverDraftTransactionXML xml
)

select * from tbl_OverDraftLog

--create table Customer

create table tbl_Customer
(CustomerID int primary key not null,
CustomerAddress1 varchar(30),
CustomerAddress2 varchar(30),
CustomerFirstName  varchar(30),
CustomerMiddleInitial char(1),
CustomerLastName varchar(30),
City varchar(20),
State char(2),
ZipCode char(10),
EmailAddress varchar(40),
HomePhone char(10),
CellPhone char(10),
WorkPhone char(10),
SSN char(9),
UserLoginID smallint foreign key references tbl_UserLogins(UserLoginID))

select * from tbl_Customer


--create table TransactionLog

create table tbl_TransactionLog
(TransactionID int primary key not null,
TransactionDate datetime,
TransactionTypeID tinyint foreign key references tbl_TransactionType(TransactionTypeID),
TransactionAmount money,
NewBalance money,
AccountID int foreign key references tbl_Account(AccountID),
CustomerID int foreign key references tbl_Customer(CustomerID),
EmployeeID int foreign key references tbl_Employee(EmployeeID),
UserLoginID smallint foreign key references tbl_UserLogins(UserLoginID)
)

select * from tbl_TransactionLog 


--create table Customer-Account

create table tbl_Customer_Account
(AccountID int foreign key references tbl_Account(AccountID),
CustomerID int foreign key references tbl_Customer(CustomerID))

select * from tbl_Customer_Account

--create table Login_Account

create table tbl_Login_Account
(UserLoginID smallint foreign key references tbl_UserLogins(UserLoginID),
AccountID int foreign key references tbl_Account(AccountID))

select * from tbl_Login_Account

--Q4. Insert at least 5 rows in each table. 
/** INSERT rows section **/
-------Inserting Data---------------

--tbl_UserLogins Table 

insert into tbl_UserLogins values(1,'usera', 'pwa'), 
                                 (2,'userb', 'pwa'),
								 (3,'userc', 'pwc'),
								 (4,'userd', 'pwd'),
								 (5,'usere', 'pwe')
select * from tbl_UserLogins

----------------------------------------------------------------------------
--[tbl_UserSecurityQuestions] table

insert into [dbo].[tbl_UserSecurityQuestions] values(1,'first car'),
                                                    (2,'mother name'),
													(3,'birth place'),
													(4,'grandmother name'),
													(5,'grandfather name')

select * from [tbl_UserSecurityQuestions]

-----------------------------------------------------------------------------

--[dbo].[tbl_UserSecurityAnswers] table

insert into [dbo].[tbl_UserSecurityAnswers] values(1,'Mary', 2),
                                                  (2,'Mathew', 5),
												  (3,'Civic', 1),
												  (4,'Treesa', 4),
												  (5,'India', 3)

select * from tbl_UserSecurityAnswers
-------------------------------------------------------------------------

--[dbo].[tbl_Employee] table

insert into tbl_Employee values (11,'Alex', 'A', 'Ahmed', '1'),
                                (12,'Joseph', 'K', 'Barker', '0'),
								(13,'Jane', 'C', 'Braun', '0'),
								(14,'Prince', 'J', 'Mathew', '1'),
								(15,'Robert', 'S', 'John', '1')
							
select * from tbl_Employee

--------------------------------------------------------------------------------------------
--[dbo].[tbl_TransactionType]

insert into [dbo].[tbl_TransactionType] values (1,'ATM', 'Cash withdrawal', '0'),
                                               (2,'CreditCard', 'Credit card purchase', '0'),
											   (3,'Deposit', 'Add fund to account', '0'),
											   (4,'Transfer', 'Transfer from one account to another', '0'),
											   (5,'Check', 'Transactions using check', '0')

select * from [tbl_TransactionType]

----------------------------------------------------------------------------------
--[dbo].[tbl_LoginErrorLog]

insert into tbl_LoginErrorLog values (1,'2020/06/04 09:30:50','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>1</UserLoginID>
										<Code>1</Code>
										<Description> Network problem </Description>
										<Message>Poor network connection</Message>
									</Error>'),
                                     (2,'2020/08/04 09:45:30','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>2</UserLoginID>
										<Code>2</Code>
										<Description> Network problem </Description>
										<Message>Poor network connection</Message>
									</Error>'),
									 (3,'2020/09/09 11:30:20','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>3</UserLoginID>
										<Code>3</Code>
										<Description> Invalid User</Description>
										<Message> Failed to authorize user</Message>
									</Error>'),
									 (4,'2020/10/06 07:20:50','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>4</UserLoginID>
										<Code>4</Code>
										<Description> Invalid OTP </Description>
										<Message> Failed to validate OTP</Message>
									</Error>'),
									 (5,'2020/11/02 10:40:45','<?xml version="1.0" encoding="utf-8"?>
									<Error>
										<UserLoginID>5</UserLoginID>
										<Code>5</Code>
										<Description> Server down </Description>
										<Message> Failed to connect to Server</Message>
									</Error>')

select * from tbl_LoginErrorLog

------------------------------------------------------------------------------------

--[dbo].[tbl_FailedTransactionErrorType]

insert into tbl_FailedTransactionErrorType values (1,'Daily Limit reached'),
                                                  (2,'Server Failed to Connect'),
												  (3,'ATM not working'),
												  (4,'Insufficient balance'),
												  (5,'Failed to Validate')

select * from tbl_FailedTransactionErrorType

----------------------------------------------------------------------------------

--[dbo].[tbl_FailedTransactionLog]

insert into tbl_FailedTransactionLog values (1,1,'2020/06/04 09:30:50', 'Initial'),
                                            (2,2,'2020/08/04 09:45:30', 'Repeat'),
											(3,3,'2020/09/09 11:30:20', 'Pending'),
											(4,4,'2020/10/06 07:20:50', 'Not Valid'),
											(5,5,'2020/11/02 10:40:45', 'Clear')

select * from tbl_FailedTransactionLog

-----------------------------------------------------------------------------
--[dbo].[tbl_AccountStatusType]

insert into tbl_AccountStatusType values (1,'Closed'),
                                         (2,'Active'),
										 (3,'Moderate'),
										 (4,'Pending'),
										 (5,'Validating')

select * from tbl_AccountStatusType

-------------------------------------------------------------------------------

--[dbo].[tbl_AccountType]

insert into tbl_AccountType values (1,'Savings'),
                                   (2,'Checking')

select * from tbl_AccountType

-----------------------------------------------------------------------------------

--[dbo].[tbl_SavingsInterestRates]

insert into tbl_SavingsInterestRates values (1,.005, 'Minimum'),
                                            (2,.02, 'Average'),
											(3,.03, 'High'),
											(4,.04, 'Highest'),
											(5,.06, 'Maximum')

select * from tbl_SavingsInterestRates

-------------------------------------------------------------------------------------

--[dbo].[tbl_Account]

insert into tbl_Account values (1,13000, 1, 2, 1),
                               (2,7000, 2, 2, 2),
							   (3,30000, 2, 2, 2),
							   (4,5000, 2, 2, 2),
							   (5,12000, 1, 2, 1)

select * from tbl_Account

----------------------------------------------------------------------------------------
--[dbo].[tbl_OverDraftLog]

insert into tbl_OverDraftLog values (1,'2020/06/04 09:30:50', 0, 'Success'),
                                    (2,'2020/08/04 09:45:30', 5, 'Pending'),
									(3,'2020/09/09 11:30:20', 20, 'Success'),
									(4,'2020/10/06 07:20:50', 15, 'Pending'),
									(5,'2020/11/02 10:40:45', 10, 'Success')

select * from tbl_OverDraftLog
-------------------------------------------------------------------------------------------------

--[dbo].[tbl_Customer]


insert into tbl_Customer values
(1, 'Clara', 'Drive', 'Matt', 'P', 'Grey', 'Vancouver', 'BC', 'L4T1T9', 'matt@gmail.com', '4167897654', '4567098754','7898900987', '455677899', 1),
(2, 'Darcel', 'Avenue', 'Thomas', 'K', 'Brown', 'Mississauga', 'ON', 'L4T2C7', 'thomas@gmail.com', '4378996543', '7658905432','8907653456', '122344566', 2),
(3, 'Woodruff', 'Crescent', 'EThan', 'L', 'Mathew', 'Toronto', 'ON', 'M6Y5TB', 'ethan@gmail.com', '4288907654', '6788907654', '7895671234', '211433677', 3),
(4, 'Dunrankin', 'Drive', 'George', 'B', 'Philip', 'Calgary', 'AB', 'N8H2WD', 'george@gmail.com', '4215678765', '6554327890', '4563213456', '566988766', 4),
(5, 'Rockhill', 'Road', 'Kevin', 'A', 'John', 'Brampton', 'ON', 'M9K7GH', 'kevin@gmail.com', '4560985678', '8997653456', '4321237890', '899077566', 5);

select * from tbl_Customer

----------------------------------------------------------------------------------------------------------

--[dbo].[tbl_TransactionLog]

insert into tbl_TransactionLog values
(1,'2020/06/04 09:30:50', 1,1000, 14000, 1, 1, 11, 1),
(2,'2020/08/04 09:45:30', 2,500, 7500, 2, 2, 12, 2),
(3,'2020/09/09 11:30:20', 3,2000, 28000, 3, 3, 13, 3),
(4,'2020/10/06 07:20:50', 4,4000, 9000, 4, 4, 14, 4),
(5,'2020/11/02 10:40:45', 5,1000, 11000, 5, 5, 15, 5)

select * from tbl_TransactionLog

-------------------------------------------------------------------------------------------
--[dbo].[tbl_Customer_Account]

insert into tbl_Customer_Account values(1,1), (1,2), (3,3), (4,4), (4,2),(2,5)

select * from tbl_Customer_Account


--------------------------------------------------------------------------------------

--[dbo].[tbl_Login_Account]


insert into tbl_Login_Account values (1,1), (2,2), (3,3), (4,4), (5,5)

select * from tbl_Login_Account

-------------------------------------------------------------------------------------------

-- PHASE II of project begins

--Q1. Create a view to get all customers with checking account from ON province.


use dbBankProject_Shalu       ----changing current database to the project database

Go

Drop view VW_ONCheking         ----Deleting view if already exists

Go

Create view VW_ONCheking                                          --assigning name for the view
as
select C.CustomerID,c.CustomerFirstName+' '+c.CustomerLastName [Custome Name],c.State,at.AccountTypeDescription
from tbl_Customer c 
join tbl_Customer_Account ca on C.CustomerID=ca.CustomerID        ---joining tables
join tbl_Account a on ca.AccountID=a.AccountID
join tbl_AccountType at on a.AccountTypeID=at.AccountTypeID
where at.AccountTypeDescription='Checking' and c.State='ON';       -----providing filter for the state = ON

select * from VW_ONCheking


------------------------------------------------------------------------------------------------
--2.Create a view to get all customers with total account balance (including interest rate) greater than 5000. [Advanced]


use dbBankProject_Shalu       ----changing current database to the project database

Go

DROP VIEW VW_Customer_Acc_IR    -------Deleting view if already exists

Go

CREATE VIEW VW_Customer_Acc_IR    -----assigning name for the view
AS
SELECT distinct c.CustomerFirstName+' '+c.CustomerLastName [Customer Name], at.AccountTypeDescription as [account Type],
a.CurrentBalance, s.InterestRateValue,
SUM(a.CurrentBalance + (a.CurrentBalance * (s.InterestRateValue/12))) AS Total_Account_Balance 
FROM tbl_Customer c
JOIN tbl_Customer_Account ca on C.CustomerID=ca.CustomerID
JOIN tbl_Account a ON ca.AccountID = a.AccountID
JOIN tbl_AccountType at ON a.AccountTypeID = at.AccountTypeID
JOIN tbl_SavingsInterestRates s ON a.InterestSavingsRateID = s.InterestSavingsRateID 
GROUP BY c.CustomerFirstName,c.CustomerLastName ,(a.CurrentBalance),s.InterestRateValue, at.AccountTypeDescription 
HAVING SUM(a.CurrentBalance + (a.CurrentBalance * s.InterestRateValue)/100) > 5000   --------providing filter >5000

GO


select * from VW_Customer_Acc_IR order by [Customer Name]

Go
-----------------------------------------------------------------------------------------------

--3. Create a view to get counts of checking and savings accounts by customer. 

DROP VIEW VW_Customer_Count_ACCTYPE;
GO

CREATE VIEW VW_Customer_Count_ACCTYPE           -----assigning name for the view
AS
SELECT c.CustomerFirstName +' '+ c.CustomerLastName as [Customer Name], 
at.AccountTypeDescription as [Account Type], 
COUNT(at.AccountTypeDescription) AS Total_AC_Types 
FROM
tbl_Customer c
join tbl_Customer_Account ca on C.CustomerID=ca.CustomerID
JOIN tbl_Account a ON ca.AccountID = a.AccountId
JOIN tbl_AccountType at ON a.AccountTypeID = at.AccountTypeID
GROUP BY  c.CustomerFirstName,c.CustomerLastName,at.AccountTypeDescription, a.AccountID;
GO

select * from VW_Customer_Count_ACCTYPE;

Go

-------------------------------------------------------------------------------------------
--Q4. Create a view to get any particular users login and password using AccountId. 

DROP VIEW VW_Account_LOGIN_PW;
GO

CREATE VIEW VW_Account_LOGIN_PWASSELECT DISTINCT ul.UserLoginID, ul.UserLogin, ul.UserPassword, la.AccountIDFROM tbl_UserLogins ulJOIN tbl_Login_Account la ON ul.UserLoginID = la.UserLoginIDGOselect * from VW_Account_LOGIN_PW where AccountID=1Go--------------------------------------------------------------------------------------------Q5. Create a view to get all customers overdraft amount. 

DROP VIEW VW_Customer_OVRDFT_AMT;
GO

CREATE VIEW VW_Customer_OVRDFT_AMT   --assigning view name
AS
SELECT DISTINCT c.CustomerID, a.AccountID, c.CustomerFirstName +' '+ c.CustomerLastName as [Customer Name], o.OverDraftAmount
FROM 
tbl_OverDraftLog o
join [dbo].[tbl_Account] a on o.AccountID = a.AccountID
join [dbo].[tbl_Customer_Account] ca on ca.AccountID = a.AccountID
JOIN tbl_Customer c on c.CustomerID = ca.CustomerID


select * from VW_Customer_OVRDFT_AMT where OverDraftAmount> 0  --filtering overdraft amount greater than 0

GO


------------------------------------------------------------------------------------------------------

--Q6. Create a stored procedure to add "User_" as a prefix to everyone's login (username). 

use dbBankProject_Shalu                        ---changing current database to the project database
go

DROP PROCEDURE sp_User_Login;
GO

CREATE PROCEDURE sp_User_Login
AS
select UserLoginID, UserLogin,concat('User_',UserLogin) as NewUserLogin from tbl_UserLogins --displaying the data in the console
--UPDATE UserLogins SET UserLogin = Concat('User_', UserLogin);  -- updating the table

GO
EXEC sp_User_Login;
GO


--------------------------------------------------------------------------------------------

--7. Create a stored procedure that accepts AccountId as a parameter and returns customer’s full name. 

use dbBankProject_Shalu                        ---changing current database to the project database
go

drop procedure spFullNameFromAccountId  
go


create proc spFullNameFromAccountId          --assigning a name for procedure
            @AccountID int,                --Defining input parameter and it's data type 
			                               -- Don't Forget to put "," between them
			@Fullname nvarchar(100) output    --Defining output parameter and it's data type 
as
begin
  if (@AccountID in (select AccountID from tbl_Customer_Account))
    begin
	  select @Fullname=c.customerFirstName+' '+c.customerMiddleInitial+''+c.customerLastName
	   from tbl_Customer C
	   JOIN tbl_Customer_Account ca on c.CustomerID = ca.CustomerID
       JOIN tbl_Account a ON ca.AccountID = a.AccountId where ca.AccountID= @AccountID
end
  else
   begin
    print 'This Account Id does not exists!'
   end
end

Declare @FullName nvarchar(100)                      --Executing for valid account id
exec spFullNameFromAccountId 3, @FullName out
Print ' Full name is '+replace (@FullName,'   ',' ')

Declare @FullName nvarchar(100)                      --Executing for invalid account id
exec spFullNameFromAccountId 6, @FullName out
Print ' Full name is '+replace (@FullName,'   ',' ')

GO

--------------------------------------------------------------------------

--Q8. Create a stored procedure that returns error logs inserted in the last 24 hours. 

DROP PROCEDURE sp_ErrorLogs_24;
GO


--update tbl_LoginErrorLog set ErrorTime = '2020/12/22 20:40:45' where ErrorLogID = 5

CREATE PROCEDURE sp_ErrorLogs_24    ----assigning procedure name
AS
begin
SELECT * FROM tbl_LoginErrorLog
WHERE  ErrorTime BETWEEN DATEADD(hh, -24, GETDATE()) AND GETDATE();
end
GO

EXEC sp_ErrorLogs_24;     --execution of stored procedure
GO


--------------------------------------------------------------------------------------------

--Q9. Create a stored procedure that takes a deposit as a parameter and updates CurrentBalance value for that particular account. 

DROP PROCEDURE sp_CurrentBalance_Deposit;

CREATE PROCEDURE sp_CurrentBalance_Deposit @AccountID INT, @Deposit money   ----assigning procedure name and defining input parameters
AS
begin
select  AccountID ,CurrentBalance,
 (CurrentBalance + @Deposit) as Updated_CurrentBalance
from tbl_Account where AccountID = @AccountID
end


EXEC sp_CurrentBalance_Deposit 3, 300;    --execution of stored procedure
GO

---------------------------------------------------------------------------------------------

--Q10. Create a stored procedure that takes a withdrawal amount as a parameter and updates CurrentBalance value for that particular account.

DROP PROCEDURE sp_CurrentBalance_Withdraw;
GO


CREATE PROCEDURE sp_CurrentBalance_Withdraw @AccountID INT, @Withdraw money  --assigning procedure name and defining input parameters
AS
begin
select  AccountID ,CurrentBalance, (CurrentBalance - @Withdraw) as Updated_CurrentBalance
from tbl_Account where AccountID = @AccountID
end

EXEC sp_CurrentBalance_Withdraw 3, 300       --execution of stored procedure