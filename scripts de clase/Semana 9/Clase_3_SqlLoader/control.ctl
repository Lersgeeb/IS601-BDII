OPTIONS (SKIP='1')
LOAD DATA
APPEND INTO TABLE STAFFS
WHEN (ACTIVE = '1')
(
STAFF_ID INTEGER EXTERNAL TERMINATED BY ", ",
FIRST_NAME CHAR TERMINATED BY ", ",
LAST_NAME CHAR TERMINATED BY ", ", 
EMAIL CHAR TERMINATED BY ", ", 
PHONE CHAR TERMINATED BY ", ", 
ACTIVE INTEGER EXTERNAL TERMINATED BY ", ", 
STORE_ID INTEGER EXTERNAL TERMINATED BY ", ",
MANAGER_ID INTEGER EXTERNAL TERMINATED BY ", " 
)