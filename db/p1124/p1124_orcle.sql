drop table board2;
drop table board3;

-- fk키 삭제후 pk를 삭제할수 있음
alter table board drop constraint board_fk_id;
alter table mem drop constraint mem_pk_id;

-- pk,fk 설정,해제
-- fk : on delete set null, on delete cascade

-- fk가 삭제가 되면, 아이디를 삭제해도, board bbb라는 아이디가 존재.
-- on delete cascade : 부모데이터 삭제시, 자식데이터 모두 삭제
-- on delete set null : 부모데이터 삭제시, 자식데이터는 null
-- mem aaa아이디를 삭제하면, board에 있는 aaa 컬럼을 모두 삭제됨.
alter table mem add constraint mem_pk_id primary key (id);
-- on delete cascade 설정됨.
alter table board add foreign key (id)
references mem (id) on delete cascade;
-- 삭제
alter table board drop constraint SYS_C008405;
-- on delete set null
alter table board add foreign key (id)
references mem (id) on delete set null;

-- board null허용설정
alter table board modify id VARCHAR2(50) null;

delete mem where id='ddd';
select * from mem;
select * from board;
insert into mem values(
'aabbcc','1111','홍홍홍','여자',sysdate,null,20
);
rollback;
commit;

select constraint_name, constraint_type, delete_rule
from user_constraints
where table_name = 'BOARD';

alter table board drop constraint 확인한이름;


-- ① cascade 외래키 삭제
alter table board drop constraint boardmem_fk_id;

-- ② set null 외래키 추가
alter table board add constraint boardmem_fk_id foreign key (id)
references mem (id) on delete set null;