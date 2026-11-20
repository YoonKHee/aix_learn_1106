create table gallery(
galcontentid varchar2(8) primary key,
galcontenttypeId number(2),
galtitle varchar2(100),
galwebimageurl varchar2(100),
galcreatedtime varchar2(15),
galmodifiedtime varchar2(15),
galphotographymonth varchar2(10),
alphotographylocation varchar2(100),
galphotographer	varchar2(100),
galsearchkeyword varchar2(500)

);
select * from gallery2;

drop table gallery;


select * from stuscore;

--order by asc, desc
select * from stuscore order by rank, height asc,kor desc;


-- 숫자함수
-- abs : 절대값
select abs(-10) from dual;


-- round(): 반올림 , ceil(): 올림, floor(): 버림(ex-7/6에서 버림하면 -2가됨), trunc(): 자르기
select abs(-3.5) from dual;

select 100/6 from dual;
select round(100/6,2) from dual;
-- floor, ceil 소수점 첫째자리에서 계산
select round(1987,-1) from dual;
select floor(-7/6) from dual;
select ceil(100/6) from dual;

select round(kor,-1),round(kor,-1) from stuscore;

select kor,trunc(kor,-1), round(kor,-1) from stuscore;

--select trunc(bdate,1) from board; 숫자로 변환해서 넣어야함 지금은 오류남.

select mod(22,2) from dual;

--stuscore 홀수학생만 출력

select * from stuscore;

select * from stuscore where mod(no,2)=1;

select * from stuscore where rank=1 or rank=3;

select * from stuscore where rank in(1,3);



-- 형변환 number, varchar2, char, clob, date
select sysdate-365,sysdate,sysdate+365+365,last_day(sysdate) from dual;


select *from member;

select mdate as 가입일,ceil(sysdate-mdate) as 가입기간 from member order by 가입기간 desc;
-- 날짜형태
select mdate,to_char(mdate,'yy/mm/dd') from member;

-- round(): 반올림
select mdate, round(mdate,'month') from member;
select mdate, round(mdate,'year') from member;

select * from board3;
select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss') from board3;
insert into board3 values(
1,'aaa','제목','내용',1,0,0,0,sysdate,'1.jpg');


-- 날짜 : 숫자함수 - round, trunc
-- 월기준 명령어 : month, mon, mm 다 사용가능
select mdate,last_day(mdate) ,trunc(mdate,'mm'),round(mdate,'mon') from member;
select mdate,last_day(mdate) ,trunc(mdate,'year'),round(mdate,'year') from member;
select mdate,trunc(mdate,'yyyy') from member;

select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss') from board3; -- 12시간 기준
select bdate,to_char(bdate,'yyyy-mm-dd hh24:mi:ss') from board3; --24시간 기준


-- 요일기준 : trunc- 해당기간 일요일날짜로 변경, round: 수요일 기준으로 반올림
select mdate,trunc(mdate,'day') from member;
select sysdate,trunc(sysdate,'day') from dual;

-- 시간 기준 : hh,mi,ss 기준으로 frunc,round사용

-- months_between 두달 사이 간격계산
select mdate,sysdate, months_between(sysdate,mdate) from member;

select mdate,sysdate,trunc(months_between(sysdate,mdate)) from member where months_between(sysdate,mdate)>=12;

-- add_months : 개월추가
-- 1년후 그 1일, 마지막일 출력
select mdate,add_months(mdate,12) from member;

select mdate,add_months(mdate,12),trunc(add_months(mdate,12),'mm'),last_day(add_months(mdate,12)) from member;

select trunc(sysdate,'day') from dual; -- 전주 주일
select round(sysdate,'day') from dual; -- 돌아오는주 주일

-- 다가오는 요일의 날짜를 리턴
select next_day(sysdate,'토요일') from dual;

-- 일요일마다 행사가있어요 다음번 일요일은 언제일까요
-- 다다음주 일요일
select next_day(next_day(sysdate,'일요일'),'일요일') from dual;

-- 날짜와 날짜 사이 계산
select (sysdate-(sysdate-1)) from dual;

select sysdate-mdate from member;

-- trunc() : 달의 1일 날짜를 알려줌
-- round() : 15일 기준으로 이전이면 이번달의 1일 이후면 다음달 1일
-- last_day : 달에 마지막 날을 알려줌

-- varchar2타입
select '2026-11-20'+1 from dual; -- 에러남
select to_date('2026-11-20')+1 from dual;
select to_date('20261120')+1 from dual;
select to_date('2026/11/20')+1 from dual;
select to_date('2026.11.20')+1 from dual;

select * from gallery;
select to_date('galcreatedtime') from gallery;
select galcreatedtime from gallery;

-- substr 함수
-- 'abcdef'(0:2) : 슬라이싱
select substr(galcreatedtime,0,8) from gallery;

select substr('abcdef',3,2) from dual;

-- 2026-11-20 12:34:12 요일
-- yyyy-mm-dd hh:mi:ss day,dy(금요일,금)
select bdate from board3;
select to_char(bdate,'yyyy-mm-dd hh:mi:ss day') from board3;

insert into board3 values(
2,'aaa','222게시글','222내용',2,0,0,0,sysdate,'2.jpg'
);
commit;
select bdate from board3;

-- yyyy/mm/dd hh24:mi:ss day
select to_char(bdate,'yyyy/mm/dd hh24:mi:ss dy') from board3;

select * from member;
-- 가입일이 7월일 사람만 출력
select * from member where to_char(mdate,'mm')='07';

select * from employees;
-- 1900년대에 입사한사람
select emp_name,hire_date from employees where to_char(hire_date,'yyyy')>=1900 and to_char(hire_date,'yyyy')<2000 ;
--2000년대 입사한사람
select emp_name,hire_date from employees where to_char(hire_date,'yyyy')>=2000;

select emp_name,hire_date from employees where substr(to_char(hire_date,'yyyy'),0,2)='20';


-- kor 40점대, 60점대, 80점대 있는 사람을 출력
select * from stuscore;

select name,kor from stuscore where kor >=40 and kor <50 or kor >=60 and kor<70 or kor>=80 and kor<90 order by kor desc;

select kor,trunc(kor-1) from stuscore where trunc(kor,-1)=40 or trunc(kor-1)=60 or trunc(kor-1)=80; 

select kor from stuscore where trunc(kor,-1) in (40,60,80) order by kor desc;

-- 시간
select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss day') from board3;
select bdate,to_char(bdate,'yyyy-mm-dd pm hh') from board3;

-- 날짜타입 -> 문자타입 / 날짜형태를 변경해서 출력
-- 숫자타입 -> 문자타입
-- 자리수 : '999,999,999,999' 해당자릿 숫자가 있으면 출력 없으면 0출력
-- '000,000,000' 있으면 자리출력 없으면 0으로 채워줌
-- L : 원화표시, 영문번전 $, 일본 엔화표시
-- .00 : 소수점 표시
select * from kor_loan_status;
select to_char(salary*1425*12*10,'009,999,999,999') as yrsalary from employees;

-- loan_jan_ant * 천만단위
-- 천만원을 곱해서 자리수를 표시하시오
select * from kor_loan_status;
select to_char(loan_jan_amt*10000000,'L999,999,999,999,999') from kor_loan_status;

--날짜를 문자로 변환 : 형태를 변경
--숫자를 문자로 변환 : 천단위,원화표시
-- 숫자 날짜로 변환
select to_date(20261120,'yyyymmdd') from dual;
select to_date('20261120',yyyymmdd) from dual;

select galphotographymonth from gallery;
-- 갤러리아 먼쓰 날짜타입으로 변환
select to_date(galphotographymonth,'yyyymm') from gallery;


update gallery set galphotographymonth=to_date(galphotographymonth,'yyyymm');
--drop table gallery;
commit;

desc gallery;

alter table gallery
modify GALPHOTOGRAPHYMONTH date;

alter table gallery
add ( GALPHOTOGRAPHYMONTH2 date );

select GALPHOTOGRAPHYMONTH,GALPHOTOGRAPHYMONTH2 from gallery;

--delete gallery;

desc gallery;

update gallery set galphotographymonth2 
= to_date(galphotographymonth,'yyyymm');

commit;

rollback;

-- 컬럼삭제
alter table gallery
drop column galphotographymonth;

-- 컬럼추가
alter table gallery
add (galphotographymonth2 date);

-- 컬럼이름 변경
alter table gallery
rename column galphotographymonth2 to galphotographymonth;

-- 컬럼순서 변경
alter table gallery modify GALWEBIMAGEURL invisible;
alter table gallery modify GALSEARCHKEYWORD invisible;
alter table gallery modify GALPHOTOGRAPHER visible;
alter table gallery modify GALSEARCHKEYWORD visible;

desc gallery;

select * from gallery;

-- 날짜타입으로 변경하려니 데이터가 변경하려는 타입과 형태가 다름
drop table gallery;

select galphotographymonth from gallery;
select to_date(galphotographymonth,'yyyy-mm') from gallery;

update gallery set galphotographymonth = to_date(galphotographymonth,'yyyy-mm');
commit;

select galphotographymonth from gallery;

select to_date(galphotographymonth) from gallery;

alter table gallery modify (galphotographymonth);

alter table gallery add galphotographymonth2 date;

update gallery set galphotographymonth2 = galphotographymonth;

alter table gallery drop column galphotographymonth;

alter table gallery rename column galphotographymonth2 to galphotographymonth;
select * from gallery;

desc gallery;

select to_date(GALCREATEDTIME,'yyyymmddhh24miss') from gallery;
commit;

alter table gallery add GALCREATEDTIME2 date;

update gallery set GALCREATEDTIME2 = to_date(GALCREATEDTIME,'yyyymmddhh24miss');

alter table gallery drop column GALCREATEDTIME;

update gallery set GALMODIFIEDTIME = to_date(GALMODIFIEDTIME,'yyyymmddhh24miss'); 

alter table gallery add GALMODIFIEDTIME2 date;

update gallery set GALMODIFIEDTIME2 = to_date(GALMODIFIEDTIME,'yyyymmddhh24miss'); 

