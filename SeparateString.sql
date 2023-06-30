CREATE FUNCTION dbo.SA_SeparateString (@String varchar(50), @separator char(1) = '/')
RETURNS varchar(101)
AS
BEGIN

DECLARE @licznik smallint = 0
DECLARE @tmp varchar(1024) = ''

WHILE (LEN(@String) >= @licznik)
BEGIN
SET @licznik = @licznik+1
SET @tmp += @separator + SUBSTRING(@String,@licznik,1)
END

RETURN @tmp

END
