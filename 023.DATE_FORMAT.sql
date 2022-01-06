-- 동물이 들어온 날짜의 형식 지정 조회
-- DATE_FORMAT사용
-- %y 97 , %Y 1997
-- %m 12 , %M December
-- %d 15 , %D 15th

SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME,'%Y-%m-%d') AS 날짜
FROM ANIMAL_INS
ORDER BY  ANIMAL_ID