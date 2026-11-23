select * from member;

-- 현재 가입날짜가 10개월 이상된 사람들을 출력
select sysdate-mdate from member;

select mdate,add_months(mdate,10),add_months(mdate,-10) from member;

select mdate,add_months(sysdate,-10) where from member;

select * from member where mdate <= add_months(sysdate,-10);

-- mdate 컬럼확인
select mdate from member;

-- mdate 그 달에 1일과 막일을 출력하시오
select mdate,add_months(mdate,1),trunc(add_months(mdate,1),'mm'),last_day(mdate) from member;

select round(months_between(sysdate,mdate),2) from member;

--가입한지 8개월째 되는 회원을 출력하시오
select * from member;

select id,mdate,round(months_between(sysdate,mdate),2) from member 
where round(months_between(sysdate,mdate),2) >= 8 and round(months_between(sysdate,mdate),2) < 9;

select mdate,add_month(sysdate,-1) from member;

select mdate,trunc(months_between(sysdate,mdate)) 
from member where trunc(months_between(sysdate,mdate))=8;

select mdate,add_month(sysdate,-1) from member;

select mdate,round(months_between(sysdate,mdate),1) 
from member where round(months_between(sysdate,mdate))=9;

-- 다다음주 월요일
select next_day(next_day(sysdate,'월'),'월') from dual;

-- 년도 월,일,시,분,초 로 출력하시오
select sysdate from dual;
select to_char(mdate,'yy/mm/dd hh:mi:ss dy') from member;

select * from employees;

-- 190번대 salary(월급), 년봉, 원화연봉을 출력하는데 천단위 표시,원화 연봉은 원화표시 출력.

select employee_id, salary from employees where trunc(employee_id,-1)=190 ;

select employee_id, to_char(salary,'$999,999,999') 월급,
to_char(salary*12*1420,'L999,999,999') 연봉
from employees where employee_id between 190 and 199;

select * from gallery;

-- galmodfiedtime 날짜 포멧으로 변경
select to_date(galmodifiedtime,'yy/mm/dd hh24:mi:ss') from gallery;
update gallery set galmodifiedtime=to_date(galmodifiedtime,'yy/mm/dd');

-- date타입 새 컬럼 추가
alter table gallery add (galmodifiedtime2 date);
-- date 새 컬럼에 date으로 바꾼 형식을 저장
update gallery set galmodifiedtime2 = to_date(galmodifiedtime,'yy/mm/dd');

-- 기존 varchar2타입을 삭제
alter table gallery drop column galmodifiedtime;
-- date타입 이름은 기존 이름으로 바꾸어줌
alter table gallery rename column galmodifiedtime2 to galmodifiedtime;

select * from gallery;
desc gallery;

-- 컬럼 위치 조정 안보이게하고 보이게하면 위치가 맨 마지막으로 옮겨짐
alter table gallery modify GALWEBIMAGEURL invisible;
alter table gallery modify GALWEBIMAGEURL visible;
alter table gallery modify GALPHOTOGRAPHER  invisible;
alter table gallery modify GALPHOTOGRAPHER  visible;
alter table gallery modify GALSEARCHKEYWORD  invisible;
alter table gallery modify GALSEARCHKEYWORD  visible;

select * from gallery g;
select * from gallery;


-- 문자열 20,000 / 문자열 11,900     = 8,100으로 출력하시오
-- 숫자로 변경후 빼기를 한 후 결과값을 출력하시오
select to_number('20,000','999,999'),to_number('11,900','999,999'), to_char(to_number('20,000','999,999')-to_number('11,900','999,999'),'999,999') from dual;


--is null nvl(commission_pct,0)
select emp_name,commission_pct from employees where commission_pct is null;

select salary+salary*nvl(commission_pct,0),salary,nvl(commission_pct,0) from employees;

-- ceo를 넣으려면 숫자를 문짜로 바꿔서 대체해야함
-- manager_id : number
select manager_id,nvl(to_char(manager_id),'ceo') from employees;


-- null
-- commission_pct null 인 사람이 몇명인지 출력하시오
-- 그룹함수 - count,sum,avg,max,min
select count(*) from employees where commission_pct is null;

select * from stuscore;

select avg(kor) from stuscore;
select avg(eng) from stuscore;
select avg(math) from stuscore;

select sum(math) from stuscore;
-- 그룹함수는 개별함수와 같이 쓸수 없음
select emp_name,max(salary),min(salary) from employees; -- emp_name 은 개별함수라 그룹함수와 같이사용할수없음
select max(salary),min(salary) from employees;

-- 연봉이 가장 높을사람의 이름을 출력하시오
-- 단일컬럼과 그룹함수를 함께 사용할수 없음
select emp_name,salary from employees order by salary desc fetch first 1 rows only;

select emp_name,salary from employees where salary = (select max(salary) from employees);

--평균월급보다 작게 받는 사원을 출력하시오.
select emp_name,salary from employees where salary <=(select avg(salary) from employees);

select count(employee_id),count(manager_id) from employees;

-- stuscore, kor - 최대 최소 평균 합계
-- 국어점수 가장 적게 받은 학생을 출력하시오

select max(kor),min(kor),avg(kor),sum(kor) from stuscore;

select name,kor from stuscore where kor = (select min(kor) from stuscore);

select name||school from stuscore;

-- m이 들어간 학생 모두 출력

select count(name) from stuscore where name like '%m%' or name like '%M%';

select count(*) from stuscore where lower(name) like '%m%';

select name from stuscore;

-- 3번째에 m이 들어간 학생출력
select name from stuscore where name like '__m%';

-- lower:소문자, upper() : 대문자 initcap(): 첫글자대문자

select email,lower(email),initcap(email) from employees;

-- lpad:왼쪽에 공간을 만들어 추가함,rpad:오른쪽 
select kor,lpad(kor,5,'0') from stuscore;
select kor,rpad(kor,5,'*') from stuscore;

select * from gallery g;
desc gallery;
select GALCONTENTID from gallery where GALCONTENTID = rpad(substr(GALCONTENTID,1,3),5,'*');

select rpad((substr(GALCONTENTID,0,5)),7,'*') from gallery;

select * from gallery g;

select * from employees;

-- email 뒤의 두자리를 별표로 수정하시오
select email from employees;

select email,rpad(substr(email,0,length(email)-2),length(email),'*') from employees;

select email,substr(email,3,2) from employees;

select * from member;

-- 220-***-1823
 select tel,rpad(substr(tel,0,4),7,'*')||substr(tel,8,4) from member;

select substr(tel,0,4)||'***'||substr(tel,8,length(tel)) tel from member;

-- ltrim, rtrim : trim 공백제거 인데 개념이 조금 틀림, 
select '       aaa111 ',ltrim('       aaa111 ') from dual;
-- 특정문자 제거도됨
select '20261123',ltrim('20261101','2026') from dual;
select '00001103100',ltrim('00001103100','0'),rtrim('00001103100','0') from dual;

-- replace 문자 변환
-- 00001103100
select replace('00001103100','0','') from dual;

-- length() 문자열의 길이를 출력 빈공백 포함 계산된 길이
select emp_name,length(emp_name) from employees;

-- table 전체복사, 형태만복사
create table member2 as select * from member;
select * from member2;
create table member3 as select * from member where 1=2;
select * from member3;

-- 구조가 member 테이블과 같을때, insert 명령어를 통해 입력가능
insert into member3 select * from member;
select * from member3;
commit;

desc member;

-- member 와 컬럼명이 틀림.
create table member4(
mid varchar2(50) not null,
mname varchar2(30) not null,
mgender char(6)
);

insert into member4 (mid,mname,mgender) select id,name,gender from member;

--테이블구조복사, 테이블테이터복사,
-- 테이블구조복사
-- 테이블을 생성후 데이터복사
-- 컬럼이 다르지만, 타입이 같은 테이블에 일부 컬럼을 복사
-- 테이블 일부 구조복사, 데이터복사

create table member5 as select id,pw,name from member;

select * from member5;

select * from employees;

----------------------------------

drop table member5;

-- 도서상품 테이블
-- yes24 의 도서 상품을 보고 테이블을 구성하시오.
-- 테이블 명 bookproduct

create table bookproduct2(
    bno          number primary key,           -- 도서번호
    btitle       varchar2(200) not null,       -- 도서명
    bauthor      varchar2(100),                -- 저자
    bpublisher   varchar2(100),                -- 출판사
    bprice       number(10) not null,          -- 판매가격
    bdiscount    number(5,2) default 0,        -- 할인율
    bstock       number(5) default 0,          -- 재고수량
    bcategory    varchar2(50),                 -- 도서분류
    bisbn        varchar2(13),                 -- ISBN
    bcontent     clob,                         -- 책 소개
    bdate        date,                         -- 출판일
    bregdate     date default sysdate,         -- 상품등록일
    bupdatedate  date default sysdate,         -- 상품수정일
    bthimage     varchar2(500),                -- 썸네일이미지
    bmainimage   varchar2(500),                -- 메인이미지
    bfileimage   varchar2(500),                -- 파일첨부이미지
    bsearch      varchar2(1000)                -- 검색어
);
select * from bookproduct;


select * from member;
select to_char(sysdate,'mm') from dual;
select mdate from member where to_char(sysdate,'mm') = to_char(mdate,'mm');

-- 컬럼 추가 수정 삭제 타입변경.
select * from stuscore;
-- 컬럼추가
alter table stuscore add sturank number(3);
-- 컬럼수정 
alter table stuscore modify(total varchar2(30));
desc stuscore;
-- 컬럼안에 데이터가 변경이 가능한 형태여야 가능
--alter table stuscore modify(specialty number(5));
alter table stuscore modify(height varchar2(50));
 desc board3;
 select * from board3;
 alter table board3 modify(bstep varchar2(4));
 update board3 set bstep = null;
 
 -- 컬럼삭제
 alter table stuscore drop column sturank;
 
 -- rank 컬럼 추가
 alter table stuscore add rank number(4);
 
 -- 컬럼 이름 변경
 alter table stuscore rename column rank to srank;
 
 desc stuscore;
 
 
 create table mem (
 id varchar2(50) primary key,
 pw varchar2(100) not null,
 name varchar2(20) unique,
 gender varchar2(6) check(gender in ('남자','여자')),
 mdate date default sysdate,
 mfile varchar2(10)
 );
 
alter table mem add age number(5,2) check(age between 0 and 200); 
desc mem;
select * from mem;
insert into mem values (
'eee','1111','','여자',sysdate,'','200'
);
drop table mem;




select * from mem;

alter table mem drop constraint SYS_C008394;
alter table mem add constraint mem_pk_id primary key(id);

update board set id='eee'
where bno between 81 and 100;
-- foreign key 등록하려면, 우선 다른테이블에서 primary key로 등록이 되어있어야 한다.
select * from board;



select * from mem;


select * from board;
select bno from board order by bno;
-- 1~20 id = aaa, 21~40 id:bbb, 41~60 id :ccc, 61~80 id:ddd, 81~102 id:eee
update board set id='aaa' where bno between 1 and 20;
update board set id='bbb' where bno between 21 and 40;
update board set id='ccc' where bno between 41 and 60;
update board set id='ddd' where bno between 61 and 80;
update board set id='eee' where bno between 81 and 102;
commit;


-- foreign key 변경설정
alter table board
add constraint board_fk_id foreign key(id)
references mem(id)
;

select * from board;

insert into board values(
101,'abc','게시글 제목','게시글내용',101,0,0,0,sysdate,''
);

select * from board2;

create table member2 as select * from member;


drop table member2;

drop table mem;