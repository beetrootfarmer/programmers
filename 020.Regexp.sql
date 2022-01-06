-- 루시와 엘라 조회하기
-- REGEXP(정규표현식)를 사용해서 [Lucy와 Ella~~를 포함하는 조건]
--  ^Lucy$ 문자열이 Lucy로 시작하고 끝나는 조건
SELECT ANIMAL_ID,NAME,SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME REGEXP "^(Lucy|Ella|Pickle|Rogan|Sabrina|Mitty)$"
ORDER BY ANIMAL_ID