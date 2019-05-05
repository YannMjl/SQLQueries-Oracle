-- ************************************************************************************************
-- Assignment #5 - SQL Part 2                                                                     *
-- Author : Yann Mulonda                                                                          *
-- Date : May 4, 2019                                                                             *
-- ************************************************************************************************
-- 1. an SQL CREATE TABLE statement to create the PET_OWNER tableas shown above. 
-- Use appropriate data types and column properties as you see fit.

-- Create PET_OWNER (OwnerID, OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)
CREATE  TABLE PET_OWNER
(
	OwnerID			        Int 			NOT NULL,
	OwnerFirstName			Char(25) 		NOT NULL,
	OwnerLastName			Char(25) 		NOT NULL,
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
	PetDOB      		Date			NOT NULL,
	OwnerID			    Int 			NOT NULL,

	CONSTRAINT 			PET_PK			PRIMARY KEY (PetID),
	CONSTRAINT 			PET_OWNER_FK    FOREIGN KEY	(OwnerID)
								REFERENCES PET_OWNER(OwnerID)
);

CREATE SEQUENCE seqIID INCREMENT BY 1 START WITH 1;