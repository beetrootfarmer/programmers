-- 보호소에 들어온 동물 리스트 ANIMAL_INS
-- 보호소에서 입양보낸 동물 리스트 ANIMAL_OUTS
-- 보낸기록은 있지만 들어온 기록은 없는 동물 리스트 출력하기
-- >>> 보낸동물 테이블의 ANIMAL_ID를 기준으로 LEFT JOIN
-- >>> IN테이블에 ID가 NULL이면 OUT테이블의 ID를 출력

SELECT o.ANIMAL_ID,o.NAME
FROM ANIMAL_OUTS o LEFT OUTER JOIN ANIMAL_INS i
    on o.ANIMAL_ID=i.ANIMAL_ID
WHERE i.ANIMAL_ID IS NULL
ORDER BY o.ANIMAL_ID ASC