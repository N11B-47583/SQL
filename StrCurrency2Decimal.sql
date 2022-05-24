CREATE FUNCTION [dbo].[Str2Decimal] (@value varchar(20)) -- for example. SELECT dbo.Str2Decimal('51.21 mln') returns 51 210 000
RETURNS
decimal(19,2)
AS 
BEGIN 
DECLARE @amount varchar(20) = REPLACE(@value,',','.')
DECLARE @multiplier int = 0

SET @multiplier = CASE   WHEN @amount LIKE '%mld%' THEN 1000000000
						 WHEN @amount LIKE '%mln%' THEN 1000000 
						 WHEN @amount LIKE '%tys%' THEN 1000
						 ELSE 1 END

RETURN(
CONVERT(decimal(19,4),SUBSTRING(@amount,1,ISNULL(NULLIF(PATINDEX('%[^0-9]%',REPLACE(@amount,'.','')),0),LEN(@amount)))) * @multiplier
)
END
GO
