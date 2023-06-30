CREATE OR ALTER FUNCTION fnGetNumeric (@text varchar(512))
RETURNS varchar(512)
AS
BEGIN
DECLARE @iters int = 1
DECLARE @integers varchar(100) = ''

WHILE @iters <= LEN(@text)
BEGIN
SET @integers += CASE WHEN ISNUMERIC(SUBSTRING(@text,@iters,1))=1 THEN SUBSTRING(@text,@iters,1) ELSE '' END
SET @iters += 1
END
RETURN @integers
END
