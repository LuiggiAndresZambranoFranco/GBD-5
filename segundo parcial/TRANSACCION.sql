/*==============================================================*/
/* Transaccion 1                                        */
/*==============================================================*/*/


create or replace procedure transaccion()
language plpgsql
as $$
begin

update sueldo set sueldo_total=(aumento+sueldos);
if (select count(id_sueldo) as error from sueldo where sueldo_total is null)< 0 then rollback;
else
commit;
end if;
end
$$;
call transaccion();

/*==============================================================*/
/* Transaccion 2                                        */
/*==============================================================*/*/


	
	create or replace procedure transaccion2()
language plpgsql
as $$
begin

update tratamientos set precio=(cantidad*100);
if (select count(id_tratamiento) as error from tratamientos where precio is null)< 0 then rollback;
else
commit;
end if;
end
$$;

call transaccion2();










-- PROCEDIMIENTO ALMACENADO
CREATE OR REPLACE PROCEDURE propaquetes()
LANGUAGE PLPGSQL
AS $BODY$
BEGIN
UPDATE PAQUETE_TURISTICO SET TOTAL_PT=CANTIDAD_PT*PRECIO_PT;
IF(SELECT MAX(ID_PT) FROM PAQUETE_TURISTICO WHERE TOTAL_PT IS NULL)>0 THEN
COMMIT;
ELSE 
IF(SELECT MAX(ID_PT) FROM PAQUETE_TURISTICO WHERE TOTAL_PT IS NULL)<=0 THEN
ROLLBACK;
END IF;
END IF;
END
$BODY$;
