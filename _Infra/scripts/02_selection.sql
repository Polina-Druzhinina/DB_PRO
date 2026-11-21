-- единицы измерения
use Front;
select id, sizeid as name, 
portionrate as factor from size;

select 'insert into dim_ranges(external_id, name, factor ) values ('
     + cast(id as varchar(max)) + ','''
     + sizeid + ''','
     + cast(portionrate as varchar(max)) + ');' as sql
from size;

-- категории
select * from
(
select c.id,
       c.description as name,
       case when coalesce(c.ParentID,0) = 0 then null else c.ParentID end as parent_id,
       case when coalesce(c.ParentID,0) = 0 then null else p.description end as parent_name
from category c
left join category p on p.id = c.ParentID
) as t1
order by t1.parent_id, t1.name;

select 'insert into dim_categories(external_id, name, parent_id, parent_name) values ('
     + cast(t1.id as varchar(max)) + ','
     + '''' + isnull(t1.name,'') + ''','
     + case when t1.parent_id is null then 'null' else cast(t1.parent_id as varchar(max)) end + ','''
     + isnull(t1.parent_name,'') + ''''
     + ');' as sql
from (
  select c.id,
         c.description as name,
         case when coalesce(c.ParentID,0) = 0 then null else c.ParentID end as parent_id,
         case when coalesce(c.ParentID,0) = 0 then null else p.description end as parent_name
  from category c
  left join category p on p.id = c.ParentID
) t1
order by t1.parent_id, t1.name;

--поставщики
select * FROM
(
    select id,  clientid as name, clientgroup as parent_id,
    t2.description as parent_name
    from vendors t1
    inner join vendorgroup t2 on t1.clientgroup = t2.vendorgroupid
) as t1 order by parent_id;

select 'insert into dim_vendors(external_id, name, parent_id, parent_name) values ('
     + cast(t1.id as varchar(max)) + ','
     + '''' + isnull(t1.name,'') + ''','
     + case when t1.parent_id is null then 'null' else cast(t1.parent_id as varchar(max)) end + ','''
     + isnull(t1.parent_name,'') + '''' + ');' as sql
from (
    select id, clientid as name, clientgroup as parent_id,
           t2.description as parent_name
    from vendors t1
    inner join vendorgroup t2 on t1.clientgroup = t2.vendorgroupid
) t1
order by t1.parent_id, t1.name;

-- персонал
select personid,
       lastname,
       firstname,
       middlename,
       securityaccess
from personnel;

select 'insert into dim_personnel(personid, lastname, firstname, middlename, securityaccess) values ('
     + cast(personid as varchar(max)) + ','
     + '''' + lastname + ''','''
     + firstname + ''','''
     + middlename + '''' + ','
     + cast(securityaccess as varchar(max))
     + ');' as sql
from personnel;

-- склады (остатки)
select id as storageid,
       CompanyID as companyid,
       description,
       ResponsibleID as responsibleid,
       DepartmentID as departmentid
from storages
order by id;

select 'insert into dim_storages(storageid, companyid, description, responsibleid, departmentid) values ('
     + cast(t1.storageid as varchar(max)) + ','
     + cast(t1.companyid as varchar(max)) + ','''
     + t1.description + '''' + ','
     + cast(t1.responsibleid as varchar(max)) + ','
     + cast(t1.departmentid as varchar(max))
     + ');' as sql
from (
    select id as storageid, CompanyID as companyid, description,
           ResponsibleID as responsibleid, DepartmentID as departmentid
    from storages
) t1
order by t1.storageid;

-- типы складских операций (остатки)
select ID as operationtypeid, Description as description, Factor as factor
from bm_StorageOperationsType
order by ID;

select 'insert into dim_storage_operations_type(operationtypeid, description, factor) values ('
     + cast(t1.operationtypeid as varchar(max)) + ','''
     + t1.description + '''' + ','
     + cast(t1.factor as varchar(max))
     + ');' as sql
from (
    select ID as operationtypeid, Description as description, Factor as factor
    from bm_StorageOperationsType
) t1
order by t1.operationtypeid;

-- виды цен
select pricegroupid as external_id, description as name
from pricegroup
order by pricegroupid;

select 'insert into dim_price_groups(external_id, name) values ('
     + cast(t1.external_id as varchar(max)) + ','''
     + isnull(t1.name,'') + ''''
     + ');' as sql
from (
    select pricegroupid as external_id, description as name
    from pricegroup
) t1
order by t1.external_id;
