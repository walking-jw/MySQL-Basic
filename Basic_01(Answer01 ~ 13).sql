use madang;
select*from book;
select*from customer;
select*from orders;

	## ----- MySQL 기본문제 No.1 ~ 14 ----- ##

# 3 Tables (2 Entity + 1 Relation)
# book (4Column) : bookid , bookname , publisher , price
# customer (4Column) : custid , name , address , phone
# orders (5Column) : orderid , custid, bookid , saleprice , orderdate

	## ---------------------------------- ##

# 01. 도서번호가 1인 도서의 이름

SELECT bookname
FROM book 
WHERE bookid = 1;


# 02. 가격이 20,000원 이상인 도서의 이름

SELECT bookname 
FROM book 
WHERE price >= 20000;


# 03. 박지성(customer)의 총 구매액

SELECT sum(saleprice) 
FROM orders, customer 
WHERE orders.custid = customer.custid 
AND customer.name = '박지성';


# 04. 박지성이 구매한 도서의 수?

SELECT count(orders.custid) 
FROM orders, customer 
WHERE orders.custid = customer.custid 
AND customer.name = '박지성';


# 05. 박지성이 구매한 도서의 출판사 수?

SELECT count(publisher) 
FROM book, orders, customer 
WHERE book.bookid = orders.bookid AND orders.custid = customer.custid 
AND name = '박지성';


# 06. 마당서적 도서의 총 개수?

SELECT count(bookname) 
FROM book;


# 07. 모든 고객의 이름, 주소 출력하기

SELECT name, address 
FROM customer;


# 08. 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이를 출력

SELECT bookname, price, price-saleprice as 가격차이 
FROM book, orders, customer 
WHERE book.bookid = orders.bookid AND orders.custid = customer.custid 
AND name = '박지성';

       # ** Column 명을 바꾸고 싶을 때도 as 활용하기!
       

# 09. 2014년 7월 4일부터 7월 7일 사이에 주문받은 도서의 주문정보 출력

SELECT *
FROM orders userinfo
WHERE orderdate BETWEEN '2014-07-04' AND '2014-07-07';


# 10. 2014년 7월 4일부터 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문 정보 출력

SELECT *
FROM orders 
WHERE orderdate NOT BETWEEN '2014-07-04' AND '2014-07-07';


# 11. 성이 김씨인 고객의 이름과 주소 출력

SELECT address 
FROM customer 
WHERE name LIKE '김%';


# 12. 성이 김씨이고 이름이 '아'로 끝나는 고객의 이름과 주소 출력



# 13. 고객의 이름과 고객이름별 구매액을 출력

# 14. 주문하지 않은 고객의 이름



