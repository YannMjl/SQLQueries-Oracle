-- ***********************************************************************************
-- This command runs using the currently logged in user. The file assumes that you   * 
-- have already connected to Oracle using SYSTEM/Password on your personal machine   * 
-- or SU/SuperUser_S1 if you are using OSS machines.                                 *
-- ***********************************************************************************

-- Edit XYZ anywhere in this file to indicate your username and choose a PASSWORD for 
-- this user. Needs to be at least 8 places. Do not include $ and/or @ symbols 

create user XYZ profile default
identified by XYZpassword
default tablespace users
temporary tablespace temp
quota unlimited on users
account unlock;

commit;

GRANT connect, resource to XYZ;
GRANT create view to XYZ;

-- ***********************************************************************************
