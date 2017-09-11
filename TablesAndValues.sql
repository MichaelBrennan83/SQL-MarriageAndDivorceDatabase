
Create Table Person (
PersonID Int(10) NOT NULL UNIQUE,
FirstName Varchar(30) NOT NULL,
Surname Varchar(30) NOT NULL,
DateOfBirth DATE NOT NULL,
Gender Char (1) NOT NULL,
Status Varchar(20) NOT NULL,
Nationality Varchar(20) NOT NULL,
Religion Varchar(30) NOT NULL,
MotherBirthSurname Varchar(30) NOT NULL,
FatherBirthSurname Varchar(30) NOT NULL,
DateOfDeath Date,
PersonAddress Int NOT NULL,
PRIMARY KEY (PersonID),
FOREIGN KEY (PersonAddress) REFERENCES Location (LocationID));



INSERT INTO Person VALUE
(11112, 'Peter', 'Smith', '1980-12-28', 'M', 'Married', 'Irish', 'Catholic', 'Brown', 'Smith', null, 22223),
(11113, 'Riya', 'Ahuja', '1998-9-13', 'F', 'Married','Indian', 'Hinduism', 'Hindu', 'Ahuja', null, 22223),
(11114, 'John', 'Williams', '1982-5-14', 'M', 'Married', 'English', 'Catholic', 'Jones', 'Williams', '2016-11-22', 22224),
(11115, 'Kin Sin', 'Jun', '1981-8-12', 'M', 'Married', 'Chinese', 'Buddhism', 'Su', 'Jun', null, 22225),
(11116, 'Peter', 'Smith', '1980-12-28', 'M', 'Married', 'Irish', 'Catholic', 'Brown', 'Smith', null, 22226),
(11117, 'Mark', 'Power', '1983-1-12', 'M', 'Married', 'Irish', 'Catholic', 'Smith', 'Skelly', null, 22226),
(11118, 'Pari', 'Kooper', '1979-1-12', 'F', 'Married', 'Indian', 'Hinduism', 'Chaudhary', 'Redddy', null, 22227),
(11119, 'Mary', 'Brown', '1997-4-2', 'F', 'Married', 'Irish', 'Catholic', 'Brennan', 'Herron', null, 22210),
(11120, 'Frank', 'Brown', '1995-2-6', 'M', 'Married', 'English', 'Catholic','Brennan', 'Herron', null, 22210);


Create Table PeopleAreMarried (
MarriageCertificateID Int(10) NOT NULL UNIQUE, 
Person1 Int NOT NULL,
Person2 Int NOT NULL,
PRIMARY KEY (MarriageCertificateID),
FOREIGN KEY (Person1) REFERENCES Person (PersonID),
FOREIGN KEY (Person2) REFERENCES Person (PersonID));



INSERT INTO PeopleAreMarried VALUES 
(33334, 11112, 11113),
(33335, 11114, 11115),
(33336, 11116, 11117),
(33337, 11112, 11118),
(33338, 11119, 11120);


CREATE TABLE Marriage( 
MarriageID Int(10) NOT NULL UNIQUE, 
DateOfWedding Date NOT NULL, 
DateOfMarriage Date,
MarriageCertificate Int, 
MarriageVenue Int NOT NULL,
MarriageDivorce Int,
PRIMARY KEY (MarriageID),
FOREIGN KEY (MarriageCertificate) REFERENCES PeopleAreMarried (MarriageCertificateID),
FOREIGN KEY (MarriageVenue) REFERENCES Venue (VenueID),
FOREIGN KEY (MarriageDivorce) REFERENCES Divorce (DivorceID));



INSERT INTO Marriage VALUES
(44445, '2017-10-28', '2010-10-28', 33334, 77778, null),
(44446, '2010-3-14', '2017-3-14', 33335, 77779, 55556), 
(44447, '2016-5-12', '2016-5-12', 33336, 77710, null),
(44448, '2005-3-7', '2005-2-7', 33338, 77711, null),
(44449, '2017-5-2', '2017-5-2', 33337, 77779, null);


CREATE TABLE Location (
LocationID Int(10) NOT NULL UNIQUE,
Street Varchar (40) NOT NULL, 
City Varchar(20) NOT NULL, 
Country Varchar(20) NOT NULL, 
PRIMARY KEY (LocationID));



INSERT INTO  Location VALUES
(22223, '23 Cork Street', 'Dublin', 'Ireland'),
(22224, '6 Blueberry street', 'Manchester', 'England'),
(22225, '45 Waterfall Place', 'Pairs', 'France'),
(22226, '2A Summer Fly', 'Madrid', 'Spanish'),
(22227,'11 Hill Street Mill Road', 'Wicklow', 'Ireland'),
(22228, '6A Palace Place', 'Kerry', 'Ireland'),
(22229, '102 New Town Road', 'Dublin', 'Ireland')
(22210, '22 Collins Place', 'Dublin', 'Ireland'),
(22211, '8 Break Place', 'Millan', 'Italy');



CREATE TABLE Divorce (
DivorceID Int(10) NOT NULL UNIQUE,
DateOfApplicatonForDivorce Date NOT NULL,
GrantedDivorceDate Date,
District  Varchar(20),
PeopleAreDivorce Int,
PRIMARY KEY (DivorceID), 
FOREIGN KEY (PeopleAreDivorce) REFERENCES PeopleAreDivorce (PeopleAreDivorceID));


INSERT INTO Divorce VALUES 
(55556, '2017-1-22', '2016-2-1', 'Ireland', 66667);



CREATE TABLE PeopleAreDivorce (
PeopleAreDivorceID Int(10) NOT NULL UNIQUE,
Person1 Int NOT NULL,
Person2 Int NOT NULL,
PRIMARY KEY (PeopleAreDivorceID), 
FOREIGN KEY (Person1) REFERENCES Person (PersonID),
FOREIGN KEY (Person2) REFERENCES Person (PersonID));



INSERT INTO PeopleAreDivorce VALUES 
(66667, 11114, 11115);



CREATE TABLE Venue (
VenueID Int(10) NOT NULL UNIQUE,
PlaceOfMarriage Varchar(30) NOT NULL,
VenueAddress Int NOT NULL,
PRIMARY KEY (VenueID),
FOREIGN KEY (VenueAddress) REFERENCES Location (LocationID));



INSERT INTO Venue VALUES
(77778, 'Church', 22227),
(77779, 'Registry Office', 22229),
(77710, 'Hotel', 22223),
(77711, 'Church',22211);
