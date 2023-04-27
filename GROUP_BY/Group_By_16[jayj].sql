/*
문제 설명
다음은 중고 거래 게시판 정보를 담은 USED_GOODS_BOARD 테이블과 중고 거래 게시판 첨부파일 정보를 담은 USED_GOODS_FILE 테이블입니다. USED_GOODS_BOARD 테이블은 다음과 같으며 BOARD_ID, WRITER_ID, TITLE, CONTENTS, PRICE, CREATED_DATE, STATUS, VIEWS는 게시글 ID, 작성자 ID, 게시글 제목, 게시글 내용, 가격, 작성일, 거래상태, 조회수를 의미합니다.

Column name	Type	Nullable
BOARD_ID	VARCHAR(5)	FALSE
WRITER_ID	VARCHAR(50)	FALSE
TITLE	VARCHAR(100)	FALSE
CONTENTS	VARCHAR(1000)	FALSE
PRICE	NUMBER	FALSE
CREATED_DATE	DATE	FALSE
STATUS	VARCHAR(10)	FALSE
VIEWS	NUMBER	FALSE
USED_GOODS_USER 테이블은 다음과 같으며 USER_ID, NICKNAME, CITY, STREET_ADDRESS1, STREET_ADDRESS2, TLNO는 각각 회원 ID, 닉네임, 시, 도로명 주소, 상세 주소, 전화번호를 를 의미합니다.

Column name	Type	Nullable
USER_ID	VARCHAR(50)	FALSE
NICKANME	VARCHAR(100)	FALSE
CITY	VARCHAR(100)	FALSE
STREET_ADDRESS1	VARCHAR(100)	FALSE
STREET_ADDRESS2	VARCHAR(100)	TRUE
TLNO	VARCHAR(20)	FALSE
문제
USED_GOODS_BOARD와 USED_GOODS_USER 테이블에서 완료된 중고 거래의 총금액이 70만 원 이상인 사람의 회원 ID, 닉네임, 총거래금액을 조회하는 SQL문을 작성해주세요. 결과는 총거래금액을 기준으로 오름차순 정렬해주세요.
*/
        
/* 풀이 */

# 완료된 중고 거래 : STATUS = DONE
# 총금액이 70만 원 이상 : SUM(PRICE) >= 700000
# 회원 ID, 닉네임, 총거래금액

SELECT b.WRITER_ID
    , u.NICKNAME
    , SUM(b.PRICE) AS TOTAL_SALES
FROM USED_GOODS_BOARD AS b
JOIN USED_GOODS_USER AS u ON b.WRITER_ID = u.USER_ID
WHERE STATUS LIKE 'DONE'
GROUP BY WRITER_ID
HAVING TOTAL_SALES >= 700000
ORDER BY TOTAL_SALES ASC


/*
    중복제거**
*/