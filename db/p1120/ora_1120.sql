drop table screen2;

create table board(
bno number(4) primary key,
id varchar2(50) not null,
btitle varchar2(1000),
bcontent clob,
bgroup number(4),
bstep number(4) default 0,
bindent number(4)default 0,
bhit number(4) default 0,
bdate date default sysdate,
bfile varchar2(100)
);

select board_seq.nextval from dual;
-- nextval 하면 1씩증가
-- currval 현재 시퀀스 번호가 몇이지 확인.
select board_seq.currval from dual;


select * from board;
insert into board(bno,id,btitle,bcontent,bgroup,bfile) values(
board_seq.nextval,'aaa','제목','내용',board_seq.currval,'1.jpg'
);


--select, insert, update, delete / commit, rollbackj
rollback;
select * from board;
select * from board2;
create table board2 as select * from board;

drop table board3;

-- board 테이블 생성후 board.scv 파일을 import 하시오.
-- board2,board3 생성하시오
-- stuscore 생성후 import 하시오
-- student 생성후 임포트
-- member 생성후 임포트
create table board(
bno number(4) primary key,
id varchar2(50) not null,
btitle varchar2(1000),
bcontent clob,
bgroup number(4),
bstep number(4) default 0,
bindent number(4) default 0,
bhit number(4) default 0,
bdate date default sysdate,
bfile varchar2(50)
);

insert into board values(
board_seq.nextval,'aaa2','제목2','내용2',board_seq.currval,0,0,0,sysdate,'1.jpg'
);
select * from board;

create table board3 as select * from board where 1=2;

create table stuscore(
no number(4) primary key,
name varchar(50),
school varchar(50),
rank number(3),
height number(3),
kor number(3), 
eng number(3),
math number(3),
total number(3),
avg number(3,1),
specialty varchar(30)
);


create table students(
번호 number(4) primary key,
이름 varchar(50),
학교 varchar(50),
학년 number(3),
키 number(3),
국어 number(3),
영어 number(3),
수학 number(3),
총점 number(3),
평균 number(3,1),
SW특기 varchar2(30)
);

--drop table member;
create table member(
id varchar2(50) primary key,
pw varchar2(50),
name varchar2(50),
nickname varchar2(50),
tel varchar2(12),
gender varchar2(10) default '남자',
hobby varchar2(300) default '게임',
mdate date default sysdate
);

select * from member;
select * from stuscore;
select * from students;
select * from board;
select * from board2;
select * from board3;