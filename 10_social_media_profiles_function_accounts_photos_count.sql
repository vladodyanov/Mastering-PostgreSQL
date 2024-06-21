CREATE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INTEGER 
AS 
$$
DECLARE
    photos_count INTEGER;
BEGIN
    SELECT COUNT(p.id) INTO photos_count
    FROM accounts AS a
    	JOIN accounts_photos AS ap 
			ON a.id = ap.account_id
    			JOIN photos AS p 
					ON ap.photo_id = p.id
    WHERE a.username = account_username;
    
    RETURN photos_count;
END;
$$
LANGUAGE plpgsql;