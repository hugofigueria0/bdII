create or replace procedure ano_data (v_ano OUT dim_data.ano%type) is
begin
    for i in 1..12 loop
        for j in 1..to_char(last_day(to_date((i),'mm'))) loop
            
            insert into dim_data (data_id,dia,mês,ano,sk)
            values (''||j||''||i||''||v_ano, j, i, v_ano, seq_data.nextval);
                
        end loop;
    end loop;
end;
/

create or replace procedure anoI_anoF is

begin
    for i in 2020..2030 loop
        exec ano_data(i);
    end loop;
end;
/

create sequence seq_data;
