create table test_table
(
    id int auto_increment,
    title varchar(255) not null,
    constraint test_table_pk
        primary key (id)
);

insert into test_table (`title`) value ('test_title_aaa'), ('test_title_bbb');
