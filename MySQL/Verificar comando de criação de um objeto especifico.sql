    show create <objet> <objet-name>
    show create view item_de_pedido_especificado;
    
    show create view lista_itens_de_pedido_especificado;
    
    show create procedure procedure_fornecedor;
    
    show create function string_to_number;
    
  
    
    codigo gerado a partit do comando "show create function string_to_number;"
    
  'CREATE DEFINER=`conazweb_root`@`%` FUNCTION `string_to_number`( string VARCHAR(50) ) RETURNS varchar(150) CHARSET latin1
BEGIN
    declare cont int;
    declare finalnumber varchar(150);
    declare a varchar(1);
    set cont = 0;
    set finalnumber = '''';

   label1: REPEAT
     SET cont = cont + 1;
     set a = substr(string, cont, 1);
     set finalnumber = concat(finalnumber, lpad(ord(a), 3, 0));
   UNTIL cont >= length(string)
   END REPEAT label1;

   RETURN concat(length(finalnumber), finalnumber);

END'