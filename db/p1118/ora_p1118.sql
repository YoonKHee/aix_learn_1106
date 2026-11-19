[ 오라클 ]
-- sql query구문을 사용해서 데이터검색,입력,수정,삭제
-- 테이블 생성,삭제,변경


-- 주석임.
select * from member;


select * from employees;

-- 테이블의 컬럼 속성을 보여줌
desc employees;

-- NUMBER : 숫자타입(자리수,소수점)
--num number(4,2)
-- 4:전체자리수 , 2:소수점 21.98 정수 부분은 두자리만 사용가능
create table memnum(
bno number(4,2),
bno2 number(3)
);

insert into memnum (bno) values
(12.43412);

select * from memnum;

-- 테이블 삭제
-- drop table memnum 삭제같은 경우는 사용할때 외에 항상 주석처리 하는게 좋음

desc employees;

--select create_date from employees


-- select문 : 검색
-- insert문 : 입력
-- update문 : 수정
-- delete문 : 삭제


-- SQL 
-- DB에는 DDL,DML,DCL,TCL
-- DDL : table과 관계있는. create,alter,drop,rename,comment,truncate - 복구가 불가능함, 권한을 잘 안줌
-- DML : select,insert,update,merge,call,explain plan,lock table  - 롤백이 가능함, 커밋해야 저장됨
-- DCL : grant,revoke - 권한이라 한번 적용되면 복구 안됨

-- 위에 3개가 주요내용.
-- TCL : commit, rollback,savepoint,transaction
desc employees;

--select employee_id,emp_name from employees;
-- drop table member;
create table member(
id varchar2(20) primary key,
pw varchar2(100) not null,
name varchar2(50),
phone varchar2(20)
);

SELECT * FROM member;

insert into member (id,pw,name,phone) values(
'aaa','1111','홍길동','010-1111-1111'
);

insert into member values(
'ddd','1111','강감찬','010-2222-2222'
);

select * from member;
commit;
rollback;
insert into member values(
'ccc','1111','이순신','010-3333-3333'
);



delete from member where id='ccc';


update member set pw='4444' where id='ddd';


desc employees;

-- 사원번호, 이름, 입사일, 연봉을 출력하시오

select employee_id,emp_name,hire_date,salary from employees;


desc employees;

select salary*100 from employees;
select salary-100 from employees;
select salary+100 from employees;
select salary/100 from employees;

-- salary 사원번호/이름/월급/연봉을 구하시오

select employee_id, emp_name, salary, salary*12 from employees;
-- 달러인데 원화금액 월급으로 변경
-- 사원번호 이름 월급 원화월급

select employee_id, emp_name, salary, salary*1329.5 from employees;


select emp_name,nvl(commission_pct,0) as "n b l",salary,salary+(salary*nvl(commission_pct,0))as last_salary from employees;


select * from departments;

--null값 출력
-- 매니저아이디가 100번인 사원들을 출력하시오.
-- select 컬럼 from 테이블 where 조건절
select * from departments where manager_id <200;
-- null 계산식이 적용이 안됨 is null로 찾아야함
select * from departments where manager_id is null;

-- 2개의 컬럼을 1개의 컬럼으로 출력하는 방법
select *from employees;
select emp_name,email from employees;
-- || 사용 (|| = \+Shift)
select emp_name||email from employees;
-- concat() 사용
select concat(emp_name,email) from employees;

-- 중복제거, 정렬 -asc : 순차정렬,desc:역순정렬
-- count() : 개수
select count(distinct manager_id) from employees;
-- order by :
select * from employees order by manager_id;

select count(*) from employees;

desc employees;
-- job_id 를 중복제거해서 출력하시오
-- department_id를 중복제거해서 출력하시오
-- departments 테이블에서 부서가 몇개있는지 확인하시오
select distinct job_id from employees;
select count(job_id) from employees;
select distinct department_id from employees;
select count(department_id) from employees;
desc departments
select distinct department_id from departments order by department_id;
select distinct department_id, department_name from departments;

select emp_name,salary from employees where salary >=5000;
select count(*) from employees where salary >= 5000;

select emp_name,salary from employees where salary <=5000 or salary>=9000;


-- 3000 = 2명 ,3000 != 사원  105명
select salary from employees where salary != 3000;
select salary from employees where salary = 3000 or salary=4000 or salary=6000;
-- or을 써도되고 in()을 써도됨 왠만하면 함수사용
select salary from employees where salary in(3000,4000,6000);


--사원번호 150~200까지 출력
-- 사원번호 130번이하 180번 이상 출력
-- 사원번호 110,130,140,150 출력
select * from employees;
select employee_id from employees;
select employee_id from employees where employee_id >=150 and employee_id<=200;
select employee_id from employees where employee_id <=130 or employee_id>=180;
select employee_id from employees where employee_id in(110,130,140,150);

-- 문자검색
select * from employees;
select * from employees where email = 'DOCONNEL';

select * from employees where emp_name = 'Donald OConnell';

-- 날짜검색 >,<,=
select * from employees where hire_date <= '2005/01/01'; -- 05/01/01, 05-01-01 다 사용가능

-- 110,130,140,150, 가 아닌 사원을 출력하시오

select employee_id from employees where employee_id not in(110,130,140,150);

-- 급여가 5000~7000사이 또는 8000,9000인 사원 출력

select salary from employees where (salary >=5000 and salary<=7000) or salary in(8000,9000); 

-- 직급이 man, 부서번호 50인 사원 출력

select job_id, department_id from employees where job_id like '%MAN%' and department_id =50;

-- 100-109번까지 출력
select * from employees where employee_id >=100 and employee_id<=109 order by employee_id ;
-- between은 무조건 포함 100이상 109이하 html에서 태그로 인식될때 between 사용
select * from employees where employee_id between 100 and 109;

-- 사원번호 130~140 / 170~180 까지 출력
select employee_id from employees 
where employee_id between 130 and 140 or employee_id between 170 and 180;

select employee_id from employees 
where employee_id = 110 or employee_id =120 or employee_id = 130;

--like : 포함되어 있는
-- ex% : 첫번째 글자가 ex인것 찾아줘
-- %ex : 마지막 글자가 ex인것을 찾아줘
-- _e% : 두번째 글자가 e가 들어가는 것을 찾아줘

-- H가 포힘되어 있는 이름을 출력하시오
-- 9번째 h가 들어가 있는 이름을 출력하시오
select * from employees where emp_name like '%H%';
select * from employees where emp_name like '________H%';
--bno,id,mtitle,bcontent,bgroup,bstep,bindent,bit,bdate,bfile

create table board(
    bno      number(4),
    id       varchar2(30),
    btitle   varchar2(1000),
    bcontent varchar2(2000),   -- 긴 글이면 clob
    bgroup   number(4),
    bstep    number(4),
    bindent  number(4),
    bhit     number(4),
    bdate    date,
    bfile    varchar2(100)
);

--drop table board


select * from board;


-- btitle,bcontent 사진이 들어가 있는 게시글을 출력하시오

select btitle,bcontent from board where btitle like '%사진%' or bcontent like '%사진%';

select * from board where bno between 11 and 20;

-- 함수 lower()
select lower(id) from board;
-- substr(bdate,4,2) 글자의 4번째부터 2개를 떼온다
select bdate,substr(bdate,4,2) from board;

-- 소문자,대문자 A,a가 들어가 있는 id를 출력하시오
select id from board; where lower(id) like '%a%';
-- _글자를 찾을때
select job_id from employees where job_id like'%#_%' escape '#';

select * from employees where manager_id is null;

-- 정렬
-- 순차정렬 order by asc, 역순정렬 order by desc
select * from board order by bno desc; --bno asc;
-- 첫번째 조건이 같을때 2번째 조건을 사용하여 정렬'
-- null은 역순정렬에선 제일 위, 순차정렬은 제일 아래
select department_id,hire_date from employees order by department_id desc, hire_date asc;

-- 월급으로 역순정렬 출력하시오
select salary from employees order by salary desc;
-- 사원명으로 순차정렬 하시오.
select emp_name from employees order by emp_name asc;