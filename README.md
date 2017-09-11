# Marriage And Divorce Database

Today in the 21st-century marriage is no longer just recognise as opposite genders as some countries have changed their law to allow for same-sex marriages as did the Netherlands back in 2001 and was one of the first to allow for this change, in addition, a further 63 countries have followed their suit including Ireland. Ireland has seen great changes in the marriages ceremonies from a religious ceremony to civil ceremony as to the relation of the mix of foreign national religion beliefs and an option of Irish civil marriage ceremonies venues (Hotels, Parks, etc.). As each day two parties marry, divorce, or remarry in Ireland or one of 195 countries in the world, with each having their own law of how these parties can marry could give the process of designing a database for marriage and divorce a complex task.

## Built With

* [My SQL Workbench](https://www.mysql.com/products/workbench/) - A visual database design tool

### Entities

1. Person
2. PeopleAreMarried
3. Marriage
4. Location
5. Divorce
6. PeopleAreDivorce
7. Venue

### Attributes

- **PersonID:** Unique number that identifies each row and use to reference another table.
- **Nationality:** To identity the person legal citizenship. <br/>
- **Date of Birth:** To establish if a person is over the legal age of 18 for marriage, in some cases a person 16 can be married from a court order and 16 is the legal age in England, Wales and Northern Ireland. <br/>
- **Gender:** Not actually needed in Ireland as same sex marriage are legal but this type of information would help determine the number of civil partnership and for adoption principle on same sex marriages couples are not legally permitted to adopt a child in the Irish state. <br/>
- **Status:** To determine if someone is marriage, single or widow/widower. <br/>
- **Nationality:** Immigration, on applying for state citizenship. <br/>
- **Religion:** If both partners wish to get married in a catholic church one or both must be catholic. <br/>
- **Mother Birth Surname:** To identify any personal members i.e. stop family member from getting married. <br/>
- **Father Birth Surname:** To identify any personal member i.e. stop family member from getting married. <br/>
- **Date of Death:** To determine if a person is a widow or widower, which would give that person right to become legally married with another person or to allow one person to be entitled to a window or widowers pension and family income supplement. <br/>
- **PersonAddress:** A foreign Key that reference to the Location table primary key. <br/>
- **MarriageCertificateID:** A unique id for the recognition of two people married. <br/>
- **Person1:** Foreign Key related to PersonID in the Person table. <br/>
- **Person2:** Foreign Key related to PersonID in the Person table. <br/>
- **MarriageID:** Unique number that identifies each row. <br/>
- **Date of Wedding:** Date of wedding in question. <br/>
- **Date of Marriage:** The sign date of marriage when both parties are legally married. <br/>
- **MarriageCertificate:** Foreign Key related to MarriageCertificateID in the PeopleAreMarried table. <br/>
- **MarriageVenue:** Foreign Key related to VenueID in the Venue table. <br/>
- **MarriageDivorce:** Foreign Key related to DivorceID in the Divorce table. <br/>
- **LocationID:** Unique number that identifies each row and use to reference another table. <br/>
- **Street:** The street where the person lives, also used place of venue and marriage location. <br/>
- **City:** The city where the person lives, or The city where the marriage took place if it’s abroad or home marriages and marriage location. <br/>
- **Country:** The country where the person lives, to identify if the person current living location, or The country where the marriage took place, home or abroad and marriage location. <br/>
- **DivorceID:** Unique number that identifies each row and use to reference another table. <br/>
- **Date of Application for Divorce:** Each country have different law on this in Ireland you need to apply 4 years before a marriage is finally granted a divorce. <br/>
- **Date of Divorce was Granted:** After both parties has applied for divorce and granted by the Irish courts. <br/>
- **PeopleAreDivorce:** Foreign Key related to PeopleAreDivorceID in the PeopleAreDivorce table. <br/>
- **VenueID:** Unique number that identifies each row and use to reference Marriage table. <br/>
- **PlaceOfMarriage:** Church, registry office, Hotel. <br/>
- **VenueAddress:** Foreign Key related to LocationID in the Locationtable.

## Database Schema

Below is a designed blueprint of the collection of metadata that describes the related entities in Marriage And Divorce Database.

![screen shot 2017-09-11 at 16 16 08](https://user-images.githubusercontent.com/23315228/30282174-6a1266ea-970c-11e7-924d-09f097d0b26a.png)

## Author

* **Author-name:** Michael Brennan
* **Author-email:** michael.brennan1@ucdconnect.com
* **Github-username:** [MichaelBrennan83](https://github.com/MichaelBrennan83)
* **Copyright:** 2017 Michael Brennan
* **Category:** Development

## Terms of Use

This Project was developed as part of my college assignment and made available to help someone else working on a similar database design project.

## License

This project is licensed under the MIT License 


