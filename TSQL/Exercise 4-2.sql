CREATE TABLE WORKS (ID int, fname varchar(400))

INSERT WORKS VALUES (1, 'O~BRIEN')

SELECT * FROM WORKS

UPDATE WORKS
SET fname=REPLAce (fname, '~', '''')