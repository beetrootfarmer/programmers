-- REGEXP를 활용한 CASE문으로 사용해서 보호소 동물의 중성화 여부 파악
-- SELECT절에서 사용되는 정규표현식!
--  => WHERE SEX_UPON_INTAKE REGEXP "(Neutered|Spayed)"
SELECT ANIMAL_ID,
        NAME,
        CASE WHEN SEX_UPON_INTAKE LIKE "%Neutered%" OR SEX_UPON_INTAKE LIKE "%Spayed%"
             THEN "O" 
             ELSE "X" END AS "중성화" 
FROM ANIMAL_INS
ORDER BY 
    ANIMAL_ID ASC;

