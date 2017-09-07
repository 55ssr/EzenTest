
/* Drop Triggers */

DROP TRIGGER TRI_City_unq;
DROP TRIGGER TRI_Country_unq;



/* Drop Tables */

DROP TABLE City CASCADE CONSTRAINTS;
DROP TABLE Country CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_City_unq;
DROP SEQUENCE SEQ_Country_unq;




/* Create Sequences */

CREATE SEQUENCE SEQ_City_unq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Country_unq INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE City
(
	unq number NOT NULL,
	-- 그나라에 대한 아이디 값
	Country_ID varchar2(100) NOT NULL,
	-- 도시 아이디
	City_ID varchar2(100) NOT NULL UNIQUE,
	PRIMARY KEY (unq)
);


CREATE TABLE Country
(
	unq number NOT NULL,
	Country_ID varchar2(100) NOT NULL UNIQUE,
	Country_Name varchar2(100) NOT NULL,
	PRIMARY KEY (unq)
);



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_City_unq BEFORE INSERT ON City
FOR EACH ROW
BEGIN
	SELECT SEQ_City_unq.nextval
	INTO :new.unq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Country_unq BEFORE INSERT ON Country
FOR EACH ROW
BEGIN
	SELECT SEQ_Country_unq.nextval
	INTO :new.unq
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN City.Country_ID IS '그나라에 대한 아이디 값';
COMMENT ON COLUMN City.City_ID IS '도시 아이디';



