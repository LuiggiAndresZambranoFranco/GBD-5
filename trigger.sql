create function tg_incremento() returns trigger
as
$$
declare
aumento int;
begin 
select max(cantidad_curso) into aumento from cursos
inner join medico on medico.id_medico=cursos.id_medico
inner join sueldo on sueldo.id_medico=medico.id_medico
where cantidad_curso=new.cantidad_curso;
if(aumento<=5) then 
raise exception 'EL MEDICO NO TIENE MAS DE 5 CURSOS, NO HAY AUMENTO';
else
update sueldo set total_sueldo=total_sueldo+(total_sueldo*0.10) where total_sueldo=new.total_sueldo;
raise notice 'Incremento realizado';
return new;
end if;
end;
$$
language 'plpgsql';
create trigger tg_incremento before insert or update
on cursos for each row 
execute procedure tg_incremento();


insert into cursos values (20,2,1,'Fisioterapia deportiva','2017-08-10','2018-08-10','12 meses',2);
select *from cursos 

update cursos set (2,1,1,'Fisioterapia deportiva','2017-05-20','2018-05-24','12 meses',2)
