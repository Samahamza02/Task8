search task
delete vs truncate : delete remove (selected rows al all ) , truncate remove (all rows only )
delete هتحتاج where علشان احدد بمسحانهي اما trunacte لا 
///////
merge :
لو انا عندي جدوالين جدوال قديم و واحد جديد فا انا بابديت و اغير لو واحد موجود و لو حاجة مش موجودة بضفها 
من غير ما ستعمل  و كمانdelete update , insert 
مثال 
merge oldtable o
using newtable n
on o.id=n.id
when matched then 
update 
set o.salary =n.salary
when not matched then 
insert (id,name,salary)
values(1,'name,1000)
