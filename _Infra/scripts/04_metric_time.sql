do $$
begin
	drop table if exists dim_time;
	drop sequence if exists seq_dim_time;
	
    create sequence seq_dim_time;
	comment on sequence seq_dim_time is 'Последовательность для таблицы dim_time';
	create table dim_time
    (
        code int primary key,
        date_start date not null,
        date_end date not null,
        month_name text not null,
        year int not null,
        quarter_num int not null,
        quarter_name text not null
    );
    comment on table dim_time is 'Ресурс Время';
    comment on column dim_time.code is 'Код месяца';
    comment on column dim_time.date_start is 'Дата начала месяца';
    comment on column dim_time.date_end is 'Дата окончания месяца';
    comment on column dim_time.month_name is 'Название месяца';
    comment on column dim_time.year is 'Год';
    comment on column dim_time.quarter_num is 'Номер квартала';
    comment on column dim_time.quarter_name is 'Название квартала';
end $$;

