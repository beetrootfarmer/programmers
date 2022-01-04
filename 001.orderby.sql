-- 동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.
-- 날짜 순으로 정렬하고 한개만 조회하도록 LIMIT 적용 
SELECT NAME
FROM ANIMAL_INS
ORDER BY
    DATETIME
LIMIT 1;