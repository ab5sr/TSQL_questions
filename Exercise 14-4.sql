--1.
--Create a stored procedure that INSERTS a new row into the Application.PaymentMethods
--table. Make sure and use a TRY CATCH block and wrap it in a transaction.


USE [WideWorldImporters]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[procAddNewPmtType] @pmtType varchar(40), @UserID int=1
AS
SET NOCOUNT ON
BEGIN
    BEGIN TRY
            DECLARE @MessageExists varchar(100) = (
                                   SELECT TOP 1 PaymentMethodName 
                                    FROM Application.PaymentMethods
                                    WHERE PaymentMethodName LIKE '%'+@pmtType +'%'
                                              )
		 
			IF (@MessageExists) IS NOT NULL
			BEGIN
				PRINT 'Check for this type if it already exists'
				RETURN;
			END
			ELSE
			BEGIN
				SET XACT_ABORT ON
				DECLARE @PMI table (pmi int)

				BEGIN TRAN
					INSERT INTO Application.PaymentMethods (PaymentMethodName, LastEditedBy)
					OUTPUT Inserted.PaymentMethodID INTO @pmi
					VALUES (@pmtType, @UserID)				
				COMMIT TRAN

				SELECT pmi as ID 
				FROM @PMI				
			END														
    END TRY
	
    BEGIN CATCH	
		IF @@TRANCOUNT>0
			ROLLBACK
		
		UPDATE @PMI SET PMI=NULL--TRANSACTION ROLLED BACK; ID canceled';

		PRINT ERROR_NUMBER();
		PRINT ERROR_MESSAGE();
		PRINT ERROR_NUMBER();
		THROW  665555,  'ERROR OCCURRED - TRY AGAIN LATER',1;
		
    END CATCH


END
