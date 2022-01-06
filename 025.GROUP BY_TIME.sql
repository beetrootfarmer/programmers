-- 시간별 보호소 입양 카운트
-- COUNT, GROUPBY
-- COUNT(DATETIME)
-- WHERE DATETIME %h = "(9-19)""
-- GROUP BY DATETIME()
SELECT COUNT(DATETIME)
FROM ANIMAL_INS
WHERE DATETIME %h = "(9-19)"
GROUP BY DATETIME(COUNT)

SELECT hour(datetime) as HOUR, count(datetime) as COUNT
from animal_outs
where hour(datetime) between 9 and 19
group by hour(datetime)
order by 1;