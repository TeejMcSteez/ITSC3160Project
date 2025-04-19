CREATE PROCEDURE remove_user_token(IN target_client_id VARCHAR(255))
BEGIN
  DECLARE adminRef INT;
  SELECT ADMIN_ID INTO adminRef FROM USERS WHERE CLIENT_ID = target_client_id;

  DELETE FROM USERS WHERE CLIENT_ID = target_client_id;

  INSERT INTO AUDIT_LOG (EVENT_TYPE, CLIENT_ID, ADMIN_ID)
  VALUES ('DELETE', target_client_id, adminRef);
END;