-- ************************************************************************************************
-- Assignment #5 - SQL Part 2                                                                     *
-- Author : Yann Mulonda                                                                          *
-- Date : May 4, 2019                                                                             *
-- ************************************************************************************************

-- SQL CREATE STATEMENTS

-- 1. an SQL CREATE TABLE statement to create the PET_OWNER tableas shown above. 
-- Use appropriate data types and column properties as you see fit.

-- Create PET_OWNER (OwnerID, OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)
CREATE  TABLE PET_OWNER
(
	OwnerID			        Int 			NOT NULL,
    OwnerLastName			Char(25) 		NOT NULL,
	OwnerFirstName			Char(25) 		NOT NULL,
	OwnerPhone				Char(12)		NULL,
	OwnerEmail 				VarChar(100)	NOT NULL UNIQUE,

	    CONSTRAINT 			PET_OWNER_PK 	PRIMARY KEY(OwnerID)
);

CREATE SEQUENCE seqPet_Owner_ID INCREMENT BY 1 START WITH 1;

-- 2. an SQL CREATE TABLE statement to create the PET table, using OwnerID as a foreign key
-- that references OwnerID in the PET_OWNER table.

-- PET (PetID, PetName, PetType, PetBreed, PetDOB, OwnerID)
CREATE  TABLE PET
(
	PetID				Int	 			NOT NULL,
	PetName		        Char(25)	    NOT NULL,
    PetType			    Char(25) 		NOT NULL,
	PetBreed			Char(25) 		NULL,
	PetDOB      		Date			NULL,
	OwnerID			    Int 			NOT NULL,

	CONSTRAINT 			PET_PK			PRIMARY KEY (PetID),
	CONSTRAINT 			PET_OWNER_FK    FOREIGN KEY	(OwnerID)
								REFERENCES PET_OWNER(OwnerID)
);

CREATE SEQUENCE seqPet_ID INCREMENT BY 1 START WITH 1;

-- ************************************************************************************************
-- SQL INSERT STATEMENTS                                                                          *
-- ************************************************************************************************

-- 3. A series of 4 SQL statements to populate the PET_OWNER table, based on the figure
-- above.

INSERT INTO PET_OWNER VALUES(seqPet_Owner_ID.nextVal,
	'Downs', 'Marsha', '555-537-8765', 'Marsha.Downs@somewhere.com');
INSERT INTO PET_OWNER VALUES(seqPet_Owner_ID.nextVal,
	'James', 'Richard', '555-537-7654', 'Richard.James@somewhere.com');
INSERT INTO PET_OWNER VALUES(seqPet_Owner_ID.nextVal,
	'Frier', 'Liz', '555-537-6543', 'Liz.Frier@somewhere.com');
INSERT INTO PET_OWNER VALUES(seqPet_Owner_ID.nextVal,
	'Trent', 'Miles', '', 'Miles.Trent@somewhere.com');

-- 4. A series of 7 SQL statements to populate the PET table, based on the figure above.

INSERT INTO PET VALUES(seqPet_ID.nextVal,
	'King', 'Dog', 'Std. Poodle', '27-Feb-11', 1);
INSERT INTO PET VALUES(seqEID.nextVal,
	'Teddy', 'Cat', 'Cashmere', '01-Feb-12', 2);
INSERT INTO PET VALUES(seqPet_ID.nextVal,
	'Fido', 'Dog', 'Std. Poodle', '17-Jul-10', 1);
INSERT INTO PET VALUES(seqPet_ID.nextVal,
	'AJ', 'Dog', 'Collie Mix', '05-May-11', 3);
INSERT INTO PET VALUES(seqPet_ID.nextVal,
	'Cedro', 'Cat', 'Unknown', '06-Jun-09', 2);
INSERT INTO PET VALUES(seqPet_ID.nextVal,
	'Wooley', 'Cat', 'Unknown', '', 2);
INSERT INTO PET VALUES(seqPet_ID.nextVal,
	'Buster', 'Dog', 'Border Collie', '11-Dec-08', 4);

-- ************************************************************************************************
-- REVIEW BASIC SQL SKILLS                                                                        *
-- ************************************************************************************************

-- 5. SQL statement to show all columns and rows of the PET table.

Select *
From PET;

-- 6. SQL statement to show all columns and rows of the PET_OWNER table.

Select *
From PET_OWNER;

-- ************************************************************************************************
-- ADDITIONAL SQL SKILLS                                                                          *
-- ************************************************************************************************

-- 7. SQL statement to add a new column to the PET table, called Location (this attribute
-- represents the primary location where the pet is groomed).

ALTER TABLE PET
    ADD Location    Char(25)    NULL;

-- 8. SQL statement to update the data so that all dogs have a listed location of
-- “Minneapolis”.

UPDATE PET
SET Location = 'Minneapolis'
Where PetType = 'Dog';

-- 9. SQL statement to update the data so that all cats have a listed location of “St. Paul”.

UPDATE PET
SET Location = 'St. Paul'
Where PetType = 'Cat';

-- 10. SQL statement that deletes the word “Unknown” in any records where “Unknown” is
-- listed as the PetBreed attribute in the PET table (note: you may need to change this field to
-- allow null values first, if your create statement listed it as a “Not Null” column).

UPDATE PET
SET PetBreed = NULL
Where PetBreed = 'Unknown';
 
-- 11. SQL statement that deletes records about cats from the PET table.

Delete From PET
Where PetType = 'Cat';

-- 12. SQL statement to delete the PET table.

DROP TABLE PET;

-- 13. SQL statement to delete the PET_OWNER table.

DROP TABLE PET_OWNER;

-- End

-- ************************************************************************************************
-- “By typing this statement, I am indicating that I completed this assignment                    *
-- honestly. I did not copy answers from another person or source.”                               *
-- ************************************************************************************************