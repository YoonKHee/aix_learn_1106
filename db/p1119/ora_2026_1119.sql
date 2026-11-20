create table stuscore(
    no number(4),
    name varchar2(50),
    school varchar2(100),
    rank number(1),
    height number(4,1),
    kor number(4,1),
    eng number(4,1),
    math number(4,1),
    total number(4,1),
    avg number(5,2),
    specialty varchar2(50)
);

--drop table stuscore

-- 순차정렬
select * from stuscore order by height asc;

-- 역순정렬
select *from stuscore order by height,kor desc,eng asc;


-- 이름순으로 역순정렬
select * from stuscore order by name desc;

-- 학교순으로 순차정렬 rank 역순정렬
select * from stuscore order by school asc, rank desc;

--employees 입사일기준 순차정렬 출력은 사원번호 사원명 직급 입사일 칼럼을 출력
select employee_id,emp_name,job_id,hire_date from employees order by hire_date asc;
-- 컬럼보기
desc employees;

-- 사원번호, 부서를 출력하되 정렬 부서는 순차정렬 입사일 역순정렬 하시오
select employee_id, department_id from employees; order by department_id asc,hire_date desc; 


-- dual : 임시테이블, 가상테이블
select -1 from dual;
select (-3*4) from dual;

--abs() : 절대값
select abs(-14) from dual;
-- round(값,자리수) : 반올림 
select round(12.351341,3) from dual;

select kor,eng,math,kor+eng+math total, round((kor+eng+math)/3,1) avg from stuscore;
-- 반올림
select round((kor+eng+math)/3,1) avg from stuscore;
-- 버림 : floor
-- 올림 : ceil
select floor((kor+eng+math)/3) avg from stuscore;
select ceil((kor+eng+math)/3) avg from stuscore;
-- 자리수버림 : trunc
select trunc((kor+eng+math)/3,3) avg from stuscore;
-- mod(값,나누는값) 나머지계산
select mod(3,2) from dual;
-- -1 은 1의자리
select kor,round(kor,-1),trunc(kor,-1) from stuscore;

-- 1915,1819,1719
-- 1900,1800,1700
-- dual 사용
select trunc(1915,-2),trunc(1819,-2),trunc(1719,-2) from dual;

--사원번호 홀수인 사원 역순정렬
select employee_id from employees where mod (employee_id,2)=1 order by employee_id desc;

--stuscore 평균값이 80이상 학생
select round((kor+eng+math)/3,1)avg from stuscore where (kor+eng+math)/3 >=80 order by avg desc;

-- stuscore no 짝수 학생
select * from stuscore where mod(no,2)=0;

select * from stuscore;
select * from board;
-- 시퀀스 : 번호가 자동으로 증가, 1씩증가
select board_seq.nextval from dual;
select board_seq.currval from dual;

-- 테이블 복사
create table stuscore2 as select * from stuscore;
-- 테이블 구조만 복사
create table stuscore3 as select * from stuscore where 1=2;
select * from stuscore2;
select * from stuscore3;

insert into stuscore3 values(
board_seq.nextval,'홍길동','신림고',1,190,100,100,99,(100+100+99),(100+100+99)/3,'python'
);

select * from stuscore2;
delete stuscore3;
commit;

-- stuscore2 시퀀스를 101부터 시작
-- stuscore2 홍길동 학생 성적을 입력해보세요
create table stuscore2 as select * from stuscore;
create table stuscore3 as select * from stuscore where 1=2;
select sequence1.currval from dual;
insert into stuscore2 values(
sequence1.nextval,'홍길동','신림고',1,190,100,100,99,(100+100+99),(100+100+99)/3,'python'
);
select * from stuscore2;
commit;
select board_seq.nextval from dual;

create sequence board3_seq
increment by 1
start with 1
minvalue 1
maxvalue 9999
nocycle
nocache;



--eql 기본 select,insert,update,delete
-- 게시판리스트 - select * from stuscore
-- 게시글 입력 - insert into stuscore valus()
-- 게시글 수정 - update stuscore set name = '이순신' where no=1
-- 게시글 삭제 - delete stuscore whrer no=1

select * from stuscore2;
select sequence1.currval from dual;

insert into stuscore2 values(
sequence1.nextval, '유관순','신림고',1,170,90,90,90,271,271/3,'c'
);

delete stuscore2 where name = '유관순';

update stuscore2 set name= '유관자' where no =102;

--board 그대로 구조 데이터 모두 복사해서 board2만들고 sequence board2 생성 시작은 101, 1개의 게시글을 입력해서 출력하시오

create table board2 as select * from board;

select * from board2 order by bno desc;
-- insert 입력컬럼은 선택을 안하려면 모든 컬럼의값을 입력해야함
insert into board2 values (
board2_seq.nextval,'길똥스tm','사진공모전','눈부시게 푸르른 날',
board2_seq.nextval,0,0,1,sysdate,'3.jpg'
);
-- 원하는 값만 넣고 싶으면 지정해야함.
insert into board2 (bno,id,btitle,bcontent)values (
board2_seq.nextval,'길똥스1tm','사진공1모전','눈부시게1 푸르른 날'
);
commit;

-- 속성
desc board2;
-- 컬럼의 디폴트 값을 0으로 바꿔줌 안넣어도 null이 아닌 0으로
alter table board2 modify(bstep default 0);

-- bno primary key 등록
alter table board2 add primary key (bno);


drop table board2;

create table board2(
bno number(4) primary key,
id varchar2(50),
btitle varchar2(1000),
bcontent clob not null,
bgroup number(4),
bstep number(4) default 0,
bindent number(4) default 0,
bhit number(4) default 0,
bdate date default sysdate,
bfile varchar2(100)
);

-- board,board2 테이블 구조가 같음.
-- board의 데이터를 board2로 복사
insert into board2 select * from board;
select * from board2;
commit;

select board_seq.nextval from dual;

-- 오라클 : 숫자타입, 문자타입, 날짜타입
-- 숫자타입 : number
-- 문자타입 : varchar,char,clob,
-- 날짜타입 : date


--delete board2;
commit;

select * from board2;

insert into board2(bno,id,btitle,bcontent,bgroup,bdate) values (
1,'aaa','제목','내용',1,sysdate
);

select * from stuscore;

--drop table member;

create table member(
id varchar2(50) primary key,
pw varchar2(100),
name varchar2(30) not null,
nickname varchar2(50),
tel char (12),
gender char(6) default '남자',
hobby varchar2(50) default '게임',
mdate date default sysdate
);

select * from member;


create table screen(
sno number(4) primary key,
rank number(3),
title clob not null,
sdate date default sysdate,
percent varchar2(100),
revenue varchar2(100),
crevenue varchar2(100),
sales varchar2(100),
csales varchar2(100)
);

select * from screen;
--drop table screen2;

create table screen2(
movieCd varchar(10) primary key,
movieNm varchar2(100),
prdtYear varchar2(10),
openDt varchar2(10),
typeNm varchar2(50),
nationAlt varchar2(100),
genreAlt varchar2(200),
director varchar2(20)
);

create table screen3(
movieCd varchar(10) primary key,
movieNm varchar2(100),
prdtYear varchar2(4),
openDt varchar2(8),
typeNm varchar2(50),
prdtStatNm varchar2(100),
nationAlt varchar2(100),
genreAlt varchar2(200),
director varchar2(100),
companys varchar2(100)
);

select * from screen2;







