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

CREATE SEQUENCE seqCID INCREMENT BY 1 START WITH 1;

-- 2. an SQL CREATE TABLE statement to create the PET table, using OwnerID as a foreign key
-- that references OwnerID in the PET_OWNER table.

-- PET (PetID, PetName, PetType, PetBreed, PetDOB, OwnerID)
CREATE  TABLE PET
(
	PetID				Int	 			NOT NULL,
	PetName		        Char(25)	    NOT NULL,
    PetType			    Char(25) 		NOT NULL,
	PetBreed			Char(25) 		NOT NULL,
	PetDOB      		Date			NULL,
	OwnerID			    Int 			NOT NULL,

	CONSTRAINT 			PET_PK			PRIMARY KEY (PetID),
	CONSTRAINT 			PET_OWNER_FK    FOREIGN KEY	(OwnerID)
								REFERENCES PET_OWNER(OwnerID)
);

-- ************************************************************************************************
-- SQL INSERT STATEMENTS                                                                          *
-- ************************************************************************************************

-- 3. A series of 4 SQL statements to populate the PET_OWNER table, based on the figure
-- above.

INSERT INTO PET_OWNER VALUES(seqEID.nextVal,
	'Downs', 'Marsha', '555-537-8765', 'Marsha.Downs@somewhere.com');
INSERT INTO PET_OWNER VALUES(seqEID.nextVal,
	'James', 'Richard', '555-537-7654', 'Richard.James@somewhere.com');
INSERT INTO PET_OWNER VALUES(seqEID.nextVal,
	'Frier', 'Liz', '555-537-6543', 'Liz.Frier@somewhere.com');
INSERT INTO PET_OWNER VALUES(seqEID.nextVal,
	'Trent', 'Miles', '', 'Miles.Trent@somewhere.com');

-- 4. A series of 7 SQL statements to populate the PET table, based on the figure above.

INSERT INTO PET VALUES(seqEID.nextVal,
	'King', 'Dog', 'Std. Poodle', '27-Feb-11', 1);
INSERT INTO PET VALUES(seqEID.nextVal,
	'Teddy', 'Cat', 'Cashmere', '01-Feb-12', 2);
INSERT INTO PET VALUES(seqEID.nextVal,
	'Fido', 'Dog', 'Std. Poodle', '17-Jul-10', 1);
INSERT INTO PET VALUES(seqEID.nextVal,
	'AJ', 'Dog', 'Collie Mix', '05-May-11', 3);
INSERT INTO PET VALUES(seqEID.nextVal,
	'Cedro', 'Cat', 'Unknown', '06-Jun-09', 2);
INSERT INTO PET VALUES(seqEID.nextVal,
	'Wooley', 'Cat', 'Unknown', '', 2);
INSERT INTO PET VALUES(seqEID.nextVal,
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
