-- 시간별 보호소 입양 카운트
--  몇시 대에 가장 입양이 활발한지 시간대별 입양 건수 조회하기 
-- COUNT, GROUPBY
-- COUNT(DATETIME)
-- WHERE DATETIME %h = "(9-19)""
-- GROUP BY DATETIME()
SELECT HOUR(DATETIME) as HOUR, COUNT(DATETIME) AS COUNT
FROM ANIMAL_INS
-- WHERE DATETIME %h = "(9-19)"
WHERE HOUR(DATETIME) between 9 and 19
GROUP BY HOUR(DATETIME)
ORDER BY 1;

SELECT hour(datetime) as HOUR, count(datetime) as COUNT
from animal_outs
where hour(datetime) between 9 and 19
group by hour(datetime)
order by 1;