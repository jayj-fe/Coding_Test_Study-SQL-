/*
문제 설명
다음은 식품공장의 주문정보를 담은 FOOD_ORDER 테이블입니다. FOOD_ORDER 테이블은 다음과 같으며 ORDER_ID, PRODUCT_ID, AMOUNT, PRODUCE_DATE, IN_DATE,OUT_DATE,FACTORY_ID, WAREHOUSE_ID는 각각 주문 ID, 제품 ID, 주문양, 생산일자, 입고일자, 출고일자, 공장 ID, 창고 ID를 의미합니다.

Column name	Type	Nullable
ORDER_ID	VARCHAR(10)	FALSE
PRODUCT_ID	VARCHAR(5)	FALSE
AMOUNT	NUMBER	FALSE
PRODUCE_DATE	DATE	TRUE
IN_DATE	DATE	TRUE
OUT_DATE	DATE	TRUE
FACTORY_ID	VARCHAR(10)	FALSE
WAREHOUSE_ID	VARCHAR(10)	FALSE
문제
FOOD_ORDER 테이블에서 5월 1일을 기준으로 주문 ID, 제품 ID, 출고일자, 출고여부를 조회하는 SQL문을 작성해주세요. 출고여부는 5월 1일까지 출고완료로 이 후 날짜는 출고 대기로 미정이면 출고미정으로 출력해주시고, 결과는 주문 ID를 기준으로 오름차순 정렬해주세요.
*/
        
/* 풀이 */
SELECT ORDER_ID
    , PRODUCT_ID
    , DATE_FORMAT(OUT_DATE, '%Y-%m-%d')
    , IF(OUT_DATE is Not NULL, IF(DATEDIFF('2022-05-01', OUT_DATE) < 0, '출고대기', '출고완료'), '출고미정') AS '출고여부'
FROM FOOD_ORDER

/*
*/