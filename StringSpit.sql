CREATE OR ALTER FUNCTION dbo.StringSplit (@string varchar(1024), @delimiter char(1) = ',')
RETURNS @result TABLE (
						lp int identity,
						result varchar(100)
						)
AS
BEGIN

DECLARE @start int = 1
DECLARE @pos   int = CHARINDEX(@delimiter, @string, @start)

IF @pos = 0 
INSERT INTO @result SELECT @String

WHILE @start <= @pos 
BEGIN
	INSERT INTO @result
		SELECT SUBSTRING(@string, @start, @pos-@start) AS string
		SET @start = @pos + 1
		SET @pos = CASE WHEN CHARINDEX(@Delimiter, @String, @start) = 0 THEN LEN(@string) + 1 ELSE CHARINDEX(@delimiter, @string, @start)  END
	END
RETURN
END


