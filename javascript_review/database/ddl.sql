  create table member(
  id varchar2(15) primary key,
  pw varchar2(20) not null,
  job varchar2(20) not null,
  gender char(1) not null,
  mailYn char(1) not null,reason varchar2(1000));



create table board (
no number primary key,
poster varchar2(20),
subject varchar2(100), 
contents varchar2(2000), -- 내용
lastpost date, -- 작성일자
views number(5), -- 조회수
filename varchar2(50));

