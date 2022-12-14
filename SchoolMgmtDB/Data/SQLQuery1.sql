USE CPPDB

DROP TABLE TESTS
DROP TABLE REPORTS
DROP TABLE LECTURES
DROP TABLE COURSEHIST
DROP TABLE COURSES
DROP TABLE TEACHERS
DROP TABLE STUDENTS



CREATE TABLE STUDENTS(
	SID			INT PRIMARY KEY NOT NULL,
	USERNAME	VARCHAR(30) NOT NULL,
	PASSWORD	VARCHAR(30) NOT NULL, 
	FIRSTNAME	VARCHAR(30) NOT NULL DEFAULT(''),
	LASTNAME	VARCHAR(30) NOT NULL DEFAULT(''),
	DOB			VARCHAR(10) NOT NULL,
	ADDR1		VARCHAR(30) NOT NULL,
	ADDR2		VARCHAR(30),
	CITY		VARCHAR(30) NOT NULL,
	ST			VARCHAR(2) NOT NULL,
	ZIP			VARCHAR(5) NOT NULL,
	EMAIL		VARCHAR(30) NOT NULL,
	PHONENO		VARCHAR(15)	NOT NULL,
	GPA			DECIMAL(3,2) NOT NULL DEFAULT(0.0),
	FIXED		BIT
);

CREATE TABLE TEACHERS(
	TID			INT PRIMARY KEY NOT NULL,
	USERNAME	VARCHAR(30) NOT NULL,
	PASSWORD	VARCHAR(30) NOT NULL,
	FIRSTNAME	VARCHAR(30) NOT NULL DEFAULT(''),
	LASTNAME	VARCHAR(30) NOT NULL DEFAULT(''),
	EMAIL		VARCHAR(30) NOT NULL,
	DEPARTMENT	VARCHAR(30)	NOT NULL,
	COLLEGE		VARCHAR(30)	NOT NULL,
	SUBJECTS	VARCHAR(30)	NOT NULL,
	PHONENO		VARCHAR(15)	NOT NULL,
	WEBSITE		VARCHAR(30)	NOT NULL
);

CREATE TABLE COURSES(
	CID			INT PRIMARY KEY NOT NULL,
	COLLEGEID	INT FOREIGN KEY REFERENCES COLLEGES (COLLEGEID),
	CLASSNAME	VARCHAR(30) NOT NULL,
	TEXTBOOK	VARCHAR(30),
	MAXSIZE		INT NOT NULL,
	ROOMNO		INT NOT NULL,
	CATEGORY	VARCHAR(20) NOT NULL
);

DROP TABLE COLLEGES
CREATE TABLE COLLEGES(
	COLLEGEID	INT PRIMARY KEY NOT NULL,
	NAME		VARCHAR(30)	NOT NULL
);

DROP TABLE CATEGORIES
CREATE TABLE CATEGORIES(
	CATEGORY VARCHAR(20) 
);

CREATE TABLE COURSEHIST(
	CID			INT NOT NULL FOREIGN KEY REFERENCES COURSES (CID) ON DELETE CASCADE,
	SID			INT NOT NULL FOREIGN KEY REFERENCES STUDENTS (SID) ON DELETE CASCADE,
	POINTS		DECIMAL(8,2) NOT NULL DEFAULT(0.0),
	TIME		VARCHAR(20) NOT NULL,
	WGRADE		VARCHAR(2) NOT NULL,
	YEAR		INT NOT NULL,
	WORKDONE	INT NOT NULL
);

CREATE TABLE LECTURES(
	CID			INT NOT NULL FOREIGN KEY REFERENCES COURSES (CID) ON DELETE CASCADE,
	TID			INT NOT NULL FOREIGN KEY REFERENCES TEACHERS (TID) ON DELETE CASCADE,
	TIME		VARCHAR(20) NOT NULL,
	PRIMARY KEY (CID, TID)
);

DROP TABLE REPORTS
CREATE TABLE REPORTS(
	REPORTID	INT	NOT NULL PRIMARY KEY,
	SID			INT NOT NULL FOREIGN KEY REFERENCES STUDENTS (SID) ON DELETE CASCADE,
	TID			INT NOT NULL FOREIGN KEY REFERENCES TEACHERS (TID) ON DELETE CASCADE,
	CID			INT NOT NULL FOREIGN KEY REFERENCES COURSES (CID),
	TITLE		VARCHAR(30) NOT NULL,
	TASK		VARCHAR(200) NOT NULL,
	ANSWERS		VARCHAR(1000) NOT NULL,
	DUEDATE		VARCHAR(10) NOT NULL,
	GRADE		DECIMAL NOT NULL DEFAULT(0.0),
	YEAR		INT  NOT NULL,
	FINISHED	BIT NOT NULL,
	GRADED		BIT NOT NULL
);

DROP TABLE TESTS
CREATE TABLE TESTS(
	TESTID		INT	NOT NULL PRIMARY KEY,
	SID			INT NOT NULL FOREIGN KEY REFERENCES STUDENTS (SID) ON DELETE CASCADE,
	TID			INT NOT NULL FOREIGN KEY REFERENCES TEACHERS (TID) ON DELETE CASCADE,
	CID			INT NOT NULL FOREIGN KEY REFERENCES COURSES (CID),
	SUBJECT		VARCHAR(30) NOT NULL,
	TASK		VARCHAR(200) NOT NULL,
	ANSWERS		VARCHAR(1000) NOT NULL,
	TAKEDATE	VARCHAR(10) NOT NULL,
	GRADE		DECIMAL NOT NULL DEFAULT(0.0),
	YEAR		INT  NOT NULL,
	FINISHED	BIT NOT NULL,
	GRADED		BIT NOT NULL
);

DROP TABLE TT;
CREATE TABLE TT(
	ID			INT PRIMARY KEY NOT NULL,
	FIX			BIT,
	NAME		VARCHAR(30) NOT NULL
);

--CREATE TABLE ATABLE(
--	AA		INT PRIMARY KEY,
--	BB		VARCHAR(5)
--);

--CREATE TABLE BTABLE(
--	AB		INT FOREIGN KEY REFERENCES ATABLE (AA) ON DELETE CASCADE,
--	BC		VARCHAR(3)
--);

--INSERT INTO ATABLE VALUES(1, 'ABCDE')
--INSERT INTO ATABLE VALUES(2, 'EFGHI')
--INSERT INTO BTABLE VALUES(1, '1st')
--INSERT INTO BTABLE VALUES(2, '2nd')

--SELECT * FROM ATABLE
--SELECT * FROM BTABLE

--DELETE FROM ATABLE WHERE BB = 'ABCDE'