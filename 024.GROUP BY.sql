-- 보호소에 중복 기록된 이름 찾기
-- COUNT, GROUPBY
SELECT NAME, COUNT(NAME)
FROM ANIMAL_INS
GROUP BY NAME
-- 이름이 두 개 이상인 조건
HAVING COUNT(NAME)>1
ORDER BY NAME