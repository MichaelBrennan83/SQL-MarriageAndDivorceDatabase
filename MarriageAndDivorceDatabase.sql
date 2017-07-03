
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


---------------------------Queries and Views----------------------------------


--Show all marriages in Ireland with the date and place of marriage 
SELECT L.Country, V.PlaceOfMarriage, M.DateOfWedding
From Location L
INNER JOIN Venue V ON V.VenueAddress = L.LocationID 
INNER JOIN Marriage M ON V.VenueID = M.MarriageVenue
where Country = 'Ireland'; 


--Get the first names of all the people who are married
select p.FirstName
FROM PeopleAreMarried m
INNER JOIN Person p
ON p.PersonID IN (m.Person1, m.Person2);


----Marriage----
--This query is to show the marriage of the two people with first and second names within the database by the joining of  the person table primary key (PersonID) with the foreign keys (Person1, person2). 
SELECT PM.MarriageCertificateID, 
p1.FirstName as FirstNamePerson1, P1.Surname as SurnamePerson1,
P2.FirstName as FirstNamePerson2, P2.Surname as SurnamePerson2
from PeopleAreMarried PM
INNER JOIN Person P1 on P1.PersonID = PM.Person1
INNER JOIN Person P2 on P2.PersonID = PM.Person2;


----This query is to establish Same sex marriages---- 
--The following query below identifies all the marriages of  civil partnerships which is recognized by the where clause of the gender of both married couples, person1 gender is equal to person2 gender.
--(Could put this into a view and count the number of same sex marriages) 
SELECT m.MarriageCertificateID, 
p1.FirstName AS Person1FirstName, p1.Surname AS Person1Surname, p1.Gender AS Person1Gender, 
p2.FirstName AS Person2FirstName, p2.Surname AS Person2Surname, p2.Gender AS Person2Gender
from PeopleAreMarried m
INNER JOIN Person p1 on p1.PersonID = m.Person1
INNER JOIN Person p2 on p2.PersonID = m.Person2
where p1.Gender = 'M' AND p2.Gender = 'M' OR p1.Gender = 'F' AND p2.Gender = 'F';


----Same sex marriages view----
--Using a view inst
CREATE VIEW SameSexMarriage AS  
SELECT m.MarriageCertificateID, 
p1.FirstName AS Person1FirstName, p1.Surname AS Person1Surname, p1.Gender AS Person1Gender, 
p2.FirstName AS Person2FirstName, p2.Surname AS Person2Surname, p2.Gender AS Person2Gender
from PeopleAreMarried m
INNER JOIN Person p1 on p1.PersonID = m.Person1
INNER JOIN Person p2 on p2.PersonID = m.Person2
where p1.Gender = 'M' AND p2.Gender = 'M' OR p1.Gender = 'F' AND p2.Gender = 'F';

----Same sex marriages view query----
--Count the number of same sex marriages in the database
SELECT Count(MarriageCertificateID) AS NumberOfSameSexMarriages FROM SameSexMarriage;


----Forgein Marriages locations with first and second names----
--The database can detect marriages that don’t  happen in Ireland by joining of primary key and foreign keys, (VenueID PK = MarriageVenue FK, LocationID PK = VenueAddress FK, MarriageCertificateID PK  = MarriageCertificate FK, .PersonID PK = PM.Person1  FK, PersonID PK = PM.Person2  FK)  and using the where clause on the column Country in the location table to display all the location of marriages that do not equal to Ireland.  
SELECT p1.FirstName AS Person1FirstName, P1.Surname AS Person1Surname, 
p2.FirstName AS Person2FirstName, P2.Surname AS Person2Surname, L.Country AS LocationOfMarriage
From Marriage M
INNER JOIN Venue V ON V.VenueID = M.MarriageVenue 
INNER JOIN Location L ON L.LocationID = V.VenueAddress
INNER JOIN PeopleAreMarried PM ON PM.MarriageCertificateID = M.MarriageCertificate
INNER JOIN Person p1 on p1.PersonID = PM.Person1
INNER JOIN Person p2 on p2.PersonID = PM.Person2
Where Country != "Ireland";


----Civil Marriage----
--This query will identify all civil marriages from 2017, by the use of Inner join Marriage and Venue with the where clause on the place of marriage by date of marriage greater than 2017.
SELECT V.PlaceOfMarriage, M.DateOfMarriage
FROM Venue V
INNER JOIN Marriage M ON M.MarriageVenue = V.VenueID 
Where PlaceOfMarriage != "Church" AND DateOfMarriage > "2017";


----Divorce Details----
--Displays the divorce details of both parties with full names, the granted divorce date and shows if the divorce was due to a death.
SELECT D.District, D.DateOfApplicatonForDivorce, D.GrantedDivorceDate, CONCAT (P1.FirstName, ' ', P1.Surname) AS Person1FullName, P1.DateOfDeath, CONCAT (P2.FirstName, ' ', P2.Surname) AS Person2FullName, P2.DateOfDeath
FROM Divorce D
LEFT JOIN PeopleAreDivorce PD ON PD.PeopleAreDivorceID = D.PeopleAreDivorce
INNER JOIN Person P1 ON P1.PersonID = PD.Person1 
INNER JOIN Person P2 ON P2.PersonID = PD.Person2;


----Multiple marriages----
--Identifies the person(s) first Name, surname and Date Of Birth that have more than 1 marriage by the use of the 2 queries below begin union. 
SELECT PM.Person1 AS PersonID, P1.FirstName, P1.Surname, P1.DateOfBirth
FROM PeopleAreMarried PM
INNER JOIN Person P1 ON P1.PersonID = PM.Person1
GROUP BY PM.Person1   
HAVING COUNT(*) > 1
UNION ALL
SELECT PM.Person2 AS PersonID, P2.FirstName, P2.Surname, P2.DateOfBirth
FROM PeopleAreMarried PM
INNER JOIN Person P2 ON P2.PersonID = PM.Person2
GROUP BY PM.Person2 
HAVING COUNT(*) > 1;


----Multiple marriages view----
--A creation of view as alternative to a query would be less time consuming and begin more efficient to access these illegal marriages
CREATE VIEW MultipleMarriages AS  
SELECT PM.Person1 AS PersonID, P1.FirstName, P1.Surname, P1.DateOfBirth
FROM PeopleAreMarried PM
INNER JOIN Person P1 ON P1.PersonID = PM.Person1
GROUP BY PM.Person1   
HAVING COUNT(*) > 1
UNION ALL
SELECT PM.Person2 AS PersonID, P2.FirstName, P2.Surname, P2.DateOfBirth
FROM PeopleAreMarried PM
INNER JOIN Person P2 ON P2.PersonID = PM.Person2
GROUP BY PM.Person2 
HAVING COUNT(*) > 1;


----Illegal Family Marriages----
--Locate Illegal marriages by family members who have gotten married, this is indicated through the mother’s birth surname and father birth surname where both parties have the same mother and father birth surname. 
SELECT  CONCAT (P1.FirstName, ' ', P1.Surname) AS Person1FullName, P1.MotherBirthSurname AS Person1MotherBirthSurname , P1.FatherBirthSurname AS Person1FatherBirthSurname, 
CONCAT (P2.FirstName, ' ', P2.Surname) AS Person2FullName, P2.MotherBirthSurname AS Person2MotherBirthSurname , P2.FatherBirthSurname AS Person2FatherBirthSurname
From PeopleAreMarried PM
INNER JOIN Person P1 ON P1.PersonID = PM.Person1
INNER JOIN Person P2 ON P2.PersonID = PM.Person2
WHERE P1.MotherBirthSurname = P2.MotherBirthSurname AND P1.FatherBirthSurname = P2.FatherBirthSurname;


----Illegal Family Marriages view----
--A creation of view as alternative to a query would be less time consuming and begin more efficient to access these illegal marriages
CREATE VIEW IllegalFamilyMarriages AS
SELECT  CONCAT (P1.FirstName, ' ', P1.Surname) AS Person1FullName, P1.MotherBirthSurname AS Person1MotherBirthSurname , P1.FatherBirthSurname AS Person1FatherBirthSurname, 
CONCAT (P2.FirstName, ' ', P2.Surname) AS Person2FullName, P2.MotherBirthSurname AS Person2MotherBirthSurname , P2.FatherBirthSurname AS Person2FatherBirthSurname
From PeopleAreMarried PM
INNER JOIN Person P1 ON P1.PersonID = PM.Person1
INNER JOIN Person P2 ON P2.PersonID = PM.Person2
WHERE P1.MotherBirthSurname = P2.MotherBirthSurname AND P1.FatherBirthSurname = P2.FatherBirthSurname;

