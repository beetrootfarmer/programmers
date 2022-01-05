-- 보호소에 들어온 동물 리스트 ANIMAL_INS
-- 보호소에서 입양보낸 동물 리스트 ANIMAL_OUTS
-- 나간 날짜가 들어온 날짜보다 작은 동물(오류) 찾기
-- >>> 입양동물 테이블의 ANIMAL_ID를 기준으로 LEFT JOIN
-- >>> OUT테이블의 DATETIME 이 IN테이블의 DATETIME보다 작은 값 조회
SELECT
    INS.ANIMAL_ID, INS.NAME
FROM
    ANIMAL_INS AS INS
LEFT JOIN
    ANIMAL_OUTS AS OUTS
ON
    INS.ANIMAL_ID = OUTS.ANIMAL_ID
WHERE
    OUTS.DATETIME < INS.DATETIME
ORDER BY
    INS.DATETIME ASC;