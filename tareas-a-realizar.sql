/*Consultar el código de empleado y el número de clientes al que atiende cada empleado que es representante de ventas. 
Las cabeceras serán respectivamente “Código del Empleado” y “Clientes que atiende”*/
SELECT E.NOMBRE AS "NOMBRE DEL EMPLEADO",E.CODIGOEMPLEADO AS "CODIGO DE EMPLEADO", COUNT(C.CodigoEmpleadoRepVentas) AS "CLIENTES QUE ATIENDE"
FROM EMPLEADOS E, CLIENTES C
WHERE E.CODIGOEMPLEADO=C.CodigoEmpleadoRepVentas 
AND
UPPER(E.PUESTO)='REPRESENTANTE VENTAS'
GROUP BY E.CODIGOEMPLEADO, E.NOMBRE
ORDER BY CODIGOEMPLEADO;

SELECT E.NOMBRE AS "NOMBRE DEL EMPLEADO",E.CODIGOEMPLEADO AS "CODIGO DE EMPLEADO", COUNT(C.CodigoEmpleadoRepVentas) AS "CLIENTES QUE ATIENDE"
FROM EMPLEADOS E, CLIENTES C
WHERE E.CODIGOEMPLEADO(+)=C.CodigoEmpleadoRepVentas 
AND
UPPER(E.PUESTO)='REPRESENTANTE VENTAS'
GROUP BY E.CODIGOEMPLEADO, E.NOMBRE
ORDER BY CODIGOEMPLEADO;

/*Listar el nombre de los clientes que hayan hecho pedidos en 2008.*/
SELECT DISTINCT C.NOMBRECLIENTE
FROM CLIENTES C, PEDIDOS P
WHERE C.CODIGOCLIENTE=P.CODIGOCLIENTE
AND P.FECHAPEDIDO BETWEEN TO_DATE('2008/01/01','YYYY,MM,DD') AND (TO_DATE('2008/12/31','YYYY,MM,DD'));

SELECT NOMBRECLIENTE
FROM CLIENTES
WHERE NOMBRECLIENTE IN(SELECT CODIGOCLIENTE
                                                  FROM PEDIDOS
                                                  WHERE EXTRACT(YEAR FROM FECHAPEDIDO)=2008);
                                                  
/*Visualizar los clientes que residan en la misma ciudad donde hay una oficina, indicando dónde está la oficina.*/
SELECT NOMBRECLIENTE, CIUDAD
FROM CLIENTES
WHERE CIUDAD IN(SELECT DISTINCT CIUDAD
                                    FROM OFICINAS);
                                    
/*Sacar cuál fue el cliente que hizo el pago con mayor cuantía y el que hizo el pago con menor cuantía.*/                                                  
SELECT C.NOMBRECLIENTE, P.CANTIDAD
FROM CLIENTES C, PAGOS P
WHERE C.CODIGOCLIENTE= P.CODIGOCLIENTE
AND(
P.CANTIDAD=(SELECT MAX(CANTIDAD)FROM PAGOS)
OR
P.CANTIDAD=(SELECT MIN(CANTIDAD)FROM PAGOS))
;

/*Añade a la tabla empleados las columnas denominadas salario, numérica de 10 posiciones, y otra denominada comisión, numérica de 6 posiciones. */
ALTER TABLE EMPLEADOS ADD SALARIO NUMBER(10);
ALTER TABLE EMPLEADOS ADD COMISION NUMBER(6);
/*Crea un procedimiento almacenado denomiando p7_salari_comi 
que inserta los diferentes valores para el salario dependiendo del puesto que tenga el empleado*/
SELECT SALARIO
FROM EMPLEADOS;


CREATE OR REPLACE PROCEDURE p7_salari_comi 
IS BEGIN
UPDATE EMPLEADOS
SET SALARIO=1100
WHERE UPPER(PUESTO)='SECRETARIA';
UPDATE EMPLEADOS
SET SALARIO=1500
WHERE UPPER(PUESTO)='DIRECTOR OFICINA' ;
UPDATE EMPLEADOS
SET SALARIO=1800
WHERE UPPER(PUESTO)='SUBDIRECTOR MARKETING';
UPDATE EMPLEADOS
SET SALARIO=1800
WHERE UPPER(PUESTO)='SUBDIRECTOR VENTAS';
UPDATE EMPLEADOS
SET SALARIO=1700
WHERE UPPER(PUESTO)='REPRESENTANTE VENTAS' ;
UPDATE EMPLEADOS
SET SALARIO=2200
WHERE UPPER(PUESTO)='DIRECTOR GENERAL' ;
UPDATE EMPLEADOS
SET COMISION=0;
END ;

SELECT COMISION
FROM EMPLEADOS;
  

                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
