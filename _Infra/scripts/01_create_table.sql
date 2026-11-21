do $$
begin
	drop table if exists dim_ranges;
	drop table if exists dim_categories;
	drop table if exists dim_vendors;
	drop table if exists dim_personnel;
	drop table if exists dim_storages;
	drop table if exists dim_storage_operations_type;
	drop table if exists dim_price_groups;
	
	drop sequence if exists seq_dim_ranges;
	drop sequence if exists seq_dim_categories;
	drop sequence if exists seq_dim_vendors;
	drop sequence if exists seq_dim_personnel;
	drop sequence if exists seq_dim_storages;
	drop sequence if exists seq_dim_storage_operations_type;
	drop sequence if exists seq_dim_price_groups;
	
	-- Ресурсы единицы измерения
	create sequence seq_dim_ranges;
	comment on sequence seq_dim_ranges is 'Последовательность для таблицы dim_ranges';
	create table dim_ranges
	(
	    -- Внутренний код
	    id bigint primary key default nextval('public.seq_dim_ranges'),
	    external_id bigint,
	    name text,
	    factor float,
	    -- Дата добавления
	    date_add timestamp default now()
	);
	comment on table dim_ranges is 'Ресурсы единицы измерения';
	comment on column dim_ranges.id is 'Внутренний код';
	comment on column dim_ranges.external_id is 'Внешний идентификатор';
	comment on column dim_ranges.name is 'Наименование';
	comment on column dim_ranges.factor is 'Коэффициент';
	comment on column dim_ranges.date_add is 'Дата добавления';
	
	-- Ресурсы категорий
	create sequence seq_dim_categories;
	comment on sequence seq_dim_categories is 'Последовательность для таблицы dim_categories';
	create table dim_categories (
	  id bigint primary key default nextval('public.seq_dim_categories'),
	  external_id bigint,
	  name text,
	  parent_id bigint,
	  parent_name text,
	  date_add timestamp default now()
	);
	comment on table dim_categories is 'Ресурсы категории';
	comment on column dim_categories.id is 'Внутренний код';
	comment on column dim_categories.external_id is 'Внешний идентификатор';
	comment on column dim_categories.name is 'Наименование';
	comment on column dim_categories.parent_id is 'Внешний код родительской категории';
	comment on column dim_categories.parent_name is 'Наименование родительской категории';
	comment on column dim_categories.date_add is 'Дата добавления';

	--поставщики
	create sequence seq_dim_vendors;
	comment on sequence seq_dim_vendors is 'Последовательность для таблицы dim_vendors';
	create table dim_vendors (
	  id bigint primary key default nextval('public.seq_dim_vendors'),
	  external_id bigint,
	  name text,
	  parent_id bigint,
	  parent_name text,
	  date_add timestamp default now()
	);
	comment on table dim_vendors is 'Ресурсы поставщиков';
	comment on column dim_vendors.id is 'Внутренний код';
	comment on column dim_vendors.external_id is 'Внешний идентификатор';
	comment on column dim_vendors.name is 'Наименование';
	comment on column dim_vendors.parent_id is 'Id родителя';
	comment on column dim_vendors.parent_name is 'Имя родителя';
	comment on column dim_vendors.date_add is 'Дата добавления';

	-- персонал
	create sequence seq_dim_personnel;
	comment on sequence seq_dim_personnel is 'Последовательность для таблицы dim_personnel';
	create table dim_personnel (
		id bigint primary key default nextval('public.seq_dim_personnel'),
		personid bigint,
		lastname text,
		firstname text,
		middlename text,
		securityaccess int,
		date_add timestamp default now()
	);
	comment on table dim_personnel is 'Ресурсы персонал';
	comment on column dim_personnel.id is 'Внутренний код';
	comment on column dim_personnel.personid is 'Внешний код сотрудника';
	comment on column dim_personnel.lastname is 'Фамилия';
	comment on column dim_personnel.firstname is 'Имя';
	comment on column dim_personnel.middlename is 'Отчество';
	comment on column dim_personnel.securityaccess is 'Роль';
	comment on column dim_personnel.date_add is 'Дата добавления записи';

	-- склады (остатки)
	create sequence seq_dim_storages;
	comment on sequence seq_dim_storages is 'Последовательность для таблицы dim_storages';
	create table dim_storages (
	  id bigint primary key default nextval('public.seq_dim_storages'),
	  storageid bigint,
	  companyid int,
	  description text,
	  responsibleid bigint,
	  departmentid bigint,
	  date_add timestamp default now()
	);
	comment on table dim_storages is 'Ресурсы остатки';
	comment on column dim_storages.id is 'Внутренний код';
	comment on column dim_storages.storageid is 'Внешний код склада';
	comment on column dim_storages.companyid is 'Юрлицо';
	comment on column dim_storages.description is 'Наименование склада';
	comment on column dim_storages.responsibleid is 'Ответственный сотрудник';
	comment on column dim_storages.departmentid is 'Подразделение';
	comment on column dim_storages.date_add is 'Дата добавления записи';

	-- типы складских операций
	create sequence seq_dim_storage_operations_type;
	comment on sequence seq_dim_storage_operations_type is 'Последовательность для таблицы dim_storage_operations_type';
	create table dim_storage_operations_type (
	  id bigint primary key default nextval('public.seq_dim_storage_operations_type'),
	  operationtypeid bigint,
	  description text,
	  factor numeric,
	  date_add timestamp default now()
	);
	comment on table dim_storage_operations_type is 'Ресурсы типов складских операций';
	comment on column dim_storage_operations_type.id is 'Внутренний код';
	comment on column dim_storage_operations_type.operationtypeid is 'Внешний код типа операции';
	comment on column dim_storage_operations_type.description is 'Наименование типа операции';
	comment on column dim_storage_operations_type.factor is 'Коэффициент';
	comment on column dim_storage_operations_type.date_add is 'Дата добавления записи';

	-- виды цен
	create sequence seq_dim_price_groups;
	comment on sequence seq_dim_price_groups is 'Последовательность для таблицы dim_price_groups';
	create table dim_price_groups (
	  id bigint primary key default nextval('public.seq_dim_price_groups'),
	  external_id bigint not null unique,
	  name text,
	  date_add timestamp default now()
	);
	comment on table dim_price_groups is 'Ресурсы виды цен';
	comment on column dim_price_groups.id is 'Внутренний код';
	comment on column dim_price_groups.external_id is 'Внешний код вида цены';
	comment on column dim_price_groups.name is 'Наименование';
	comment on column dim_price_groups.date_add is 'Дата добавления записи';
end $$;