select count(*) from BirdStrikeIncident;

CALL sp_DeleteIncident ('ALASKA AIRLINES');

select count(*) from BirdStrikeIncident
where airlineID = 4;

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteIncident`(IN airlineNameIn varchar(50))
BEGIN
DECLARE airlineIDOut INT;

select airlineID INTO airlineIDOut from airline
where airlineName = airlineNameIn;

SELECT airlineIDOut;

delete from BirdStrikeIncident
where airlineID = airlineIDOut;

END
*/