-- Changing delimiter to "//" because function use ";" inside the body
DELIMITER // 

CREATE FUNCTION is_token_valid(client_id VARCHAR(255))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	DECLARE exp_time TIMESTAMP;
    SELECT EXPIRY INTO exp_time FROM USERS WHERE CLIENT_ID = client_id;
    RETURN exp_time > NOW();
END //
    
DELIMITER ;
