-- 시간별 보호소 입양 카운트
-- 1. rescursive를 사용해서 0시~23시까지의 가상테이블을 만들어준다 
-- WITH RECURSIVE TIME AS (SELECT 0 AS h UNION ALL SELECT h+1 FROM TIME WHERE h<24)
-- 2. COUNT(datetime) 으로 시간대 별 카운트 
-- SELECT HOUR(DATETIME) as HOUR, COUNT(DATETIME) AS COUNT FROM ANIMAL_OUTS WHERE HOUR(DATETIME) between 0 and 24 GROUP BY HOUR(DATETIME) ORDER BY 1;
-- 3. 1과 2 테이블을 조인한다 
--  LEFT JOIN(2번) AS b ON TIME.h = b.HOUR ORDER BY HOUR

-- 가상의 TIME 테이블 만들기 
WITH RECURSIVE TIME AS (
    -- h라고 하는 0 
    SELECT 0 AS h
    UNION ALL 
    -- 0+1 ...h가 22일때까지 SELECT h+1
    SELECT h+1 FROM TIME WHERE h<23
)
-- 위에서 만든 h (0~23)를 HOUR로 정의, 
-- IFNULL ... ANIMAL_OUTS테이블의 카운트가 NULL일때 0으로
SELECT TIME.h as 'HOUR', IFNULL(b.count,0) as 'COUNT'
FROM TIME
-- TIME TABEL을 기준으로 교집합인 HOUR 부분 조인! 
LEFT JOIN(
    SELECT HOUR(DATETIME) as 'HOUR', COUNT(DATETIME) AS 'COUNT' 
    FROM ANIMAL_OUTS 
    GROUP BY HOUR
    ) as b
        on TIME.h = b.HOUR
    ORDER BY HOUR



-- -===========================================
with recursive hr as(
    select 0 as hr
    union all
    select hr +1 from hr where hr<23)
select hr.hr as 'HOUR', ifnull(b.count,0) as 'COUNT'
from hr
left join (
    SELECT hour(datetime) as 'HOUR'
        , count(*) as 'COUNT'
    from  animal_outs
    group by hour
) as b
    on hr.hr = b.hour
order by hour