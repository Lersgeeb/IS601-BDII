OPTIONS (SKIP='1')
LOAD DATA
APPEND INTO TABLE ANIMALXDIETA
(
ANIMALID CHAR TERMINATED BY ", ",
DIETAID CHAR TERMINATED BY ", ",
FECHAINICIO DATE "yyyy/mm/dd" TERMINATED BY ", ",
FECHAFINAL DATE "yyyy/mm/dd" TERMINATED BY ", "
)


