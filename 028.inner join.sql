-- Milk와 Yogurt 키워드를 포함하는 ID 한번 출력하기 

-- 조건1  Milk와 Yogurt 키워드를 포함하는 카트
-- 조건2 목록에서 중복되는 카트 이름은 한 번 출력되도록


-- 1. 이름이 Milk와 Yogurt인 테이블 만들기
SELECT CART_ID
FROM CART_PRODUCTS
WHERE NAME REGEXP "^(Milk|Yogurt)$"
ORDER BY CART_ID



방법1. yogurt를 가진 카트 테이블과 Milk를 가진 카트 테이블 조인 
SELECT DISTINCT Y.CART_ID AS CART_ID
    FROM CART_PRODUCTS AS Y
    WHERE Y.NAME='Yogurt'
    LEFT JOIN
    (SELECT DISTINCT M.CART_ID
    FROM CART_PRODUCTS AS M
        WHERE M.NAME = 'Milk' 
    ) ON Y.CART_ID = M.CART_ID
    ORDER BY Y.CART_ID

    방법1 Inner Join으로 수정..
    SELECT DISTINCT Y.CART_ID
    FROM CART_PRODUCTS AS Y INNER JOIN CART_PRODUCTS AS M
     ON Y.CART_ID = M.CART_ID
     WHERE Y.NAME='Yogurt' AND M.NAME = 'Milk'
    ORDER BY Y.CART_ID
   


방법2. DISTINCT사용 + WHERE절에 조건 두 개
SELECT DISTINCT(CART_ID) as "CART_ID"
FROM CART_PRODUCTS
WHERE CART_ID in (SELECT CART_ID
                 FROM CART_PRODUCTS
                 WHERE NAME LIKE "Milk") and
      CART_ID in (SELECT CART_ID
                 FROM CART_PRODUCTS
                 WHERE NAME LIKE "Yogurt")

ORDER BY CART_ID ASC;

방법3. WHERE IN + COUNT(DISTINCT)
SELECT CART_ID
  FROM CART_PRODUCTS
 WHERE NAME IN ('Milk','Yogurt')
 GROUP BY CART_ID
 HAVING COUNT(DISTINCT NAME)=2

 방법4. CASE THEN ELSE 사용
 SELECT CART_ID
    FROM
    (
        SELECT CART_ID
             , SUM(CASE WHEN NAME in ('Milk')THEN 1 ELSE 0 END) AS milk_cnt
             , SUM(CASE WHEN NAME in ('Yogurt')THEN 1 ELSE 0 END) AS yogurt_cnt
            FROM CART_PRODUCTS
            WHERE 1=1
            GROUP BY CART_ID
    ) T
    WHERE 1=1
      AND milk_cnt > 0
      AND yogurt_cnt > 0