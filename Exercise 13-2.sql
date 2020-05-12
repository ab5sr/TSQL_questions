--1.
--Why is the following statement not best-practice?

BEGIN
	BEGIN TRY
		SELECT 1.234 + 'A'
	END TRY

	BEGIN CATCH
	END CATCH

END

--There is no code indicating the error in the CATCH block; the above silently errors
--without returning a message.

--2.
--Which of the following kills the connection?

--a
BEGIN
	BEGIN TRY
		SELECT 1.234 + 'A'
	END TRY

	BEGIN CATCH
	END CATCH

END

--b
 RAISERROR ('message', 127, 2) WITH LOG

--c
 RAISERROR ('message', 16,1)

--d
	None of the above
--e
	All of the above

---Only 'b' will kill a connection upon running

--3.
--Write a THROW statement, displaying the message 'An error has been thrown', using error_id 59999

THROW 59999,'An error has been thrown',1