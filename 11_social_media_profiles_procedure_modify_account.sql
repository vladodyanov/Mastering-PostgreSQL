CREATE OR REPLACE PROCEDURE udp_modify_account(
  address_street VARCHAR(30), 
  address_town VARCHAR(30)
)
LANGUAGE plpgsql
AS 
$$
BEGIN
    UPDATE accounts
    SET job_title = '(Remote) ' || job_title
    WHERE id IN (
        SELECT a.id
        FROM accounts a
        JOIN addresses ad ON a.id = ad.account_id
        WHERE ad.street = address_street
          AND ad.town = address_town
    );
END;
$$;