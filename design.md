# OAuth SQL System Design

## Session/Master Authentication (One to Many)

Provides access flow to validate an admin user as well as have that admin assign new users.

There is a master secret that is used to generate new tokens to make new users.

Therefore, a developer can allow high level access to a few users which then assign lower level access to other users.

### Master Table

Has information such as

- ID (for database)
- Entity_id (owner of the token)
- master_token (token generated by another system used to make edits to the master)

### User Table

has information such as

- Client ID (Name of the client derived from the access token)
- access_token (token generated by master token to give to client to authenticate)
- role (access token has a role associated with it, it stores them here)
- expires_in (time for that access token to be valid until the user has to relog in)
- Created_at (shows default value for when a timestamp was created)
- ADMIN_ID (foreign key linked tO admin table, automatically deleted if specific admin from admin table is deleted)

## Summary

Entity ID stores the owner of the master token the master token is used to make changes to the admins that have access to the system. It also has a access token to handoff to the users to be used to authenticate themselves.

For master token ID references the token id so if that is deleted then so should the ID for that token.
