CREATE FUNCTION dbo.SA_SeparateString (@String varchar(50), @separator char(1) = '/')
RETURNS varchar(101)
AS
BEGIN

DECLARE @licznik smallint = 0
DECLARE @tmp table (char varchar(100))

WHILE (LEN(@String) >= @licznik)
BEGIN
SET @licznik = @licznik+1
INSERT INTO @tmp SELECT @separator + SUBSTRING(@String,@licznik,1)
END

RETURN (
SELECT  '' + char FROM @tmp FOR XML PATH('')
		)
END
