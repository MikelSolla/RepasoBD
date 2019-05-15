/*Consultar el c�digo de empleado y el n�mero de clientes al que atiende cada empleado que es representante de ventas. 
Las cabeceras ser�n respectivamente �C�digo del Empleado� y �Clientes que atiende�*/
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
                                                  
/*Visualizar los clientes que residan en la misma ciudad donde hay una oficina, indicando d�nde est� la oficina.*/
SELECT NOMBRECLIENTE, CIUDAD
FROM CLIENTES
WHERE CIUDAD IN(SELECT DISTINCT CIUDAD
                                    FROM OFICINAS);
                                    
/*Sacar cu�l fue el cliente que hizo el pago con mayor cuant�a y el que hizo el pago con menor cuant�a.*/                                                  
SELECT C.NOMBRECLIENTE, P.CANTIDAD
FROM CLIENTES C, PAGOS P
WHERE C.CODIGOCLIENTE= P.CODIGOCLIENTE
AND(
P.CANTIDAD=(SELECT MAX(CANTIDAD)FROM PAGOS)
OR
P.CANTIDAD=(SELECT MIN(CANTIDAD)FROM PAGOS));

/*A�ade a la tabla empleados las columnas denominadas salario, num�rica de 10 posiciones, y otra denominada comisi�n, num�rica de 6 posiciones. */
ALTER TABLE EMPLEADOS ADD SALARIO NUMBER(10);
ALTER TABLE EMPLEADOS ADD COMISION NUMBER(6);

/*Crea un procedimiento almacenado denomiando p7_salari_comi 
que inserta los diferentes valores para el salario dependiendo del puesto que tenga el empleado*/
CREATE OR REPLACE PROCEDURE p7_salari_comi 
IS 
BEGIN
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

 /* Crear un disparador (trigger) que controle antes de modificar
 el salario de un empleado si su salario es superior a 3000.*/
CREATE OR REPLACE TRIGGER TRIG_SALARIO
BEFORE
UPDATE OF SALARIO
ON EMPLEADOS 

DECLARE
V_SALARIO EMPLEADOS.SALARIO%TYPE;

BEGIN
SELECT SALARIO 
FROM EMPLEADOS;
IF V_SALARIO > 3000 THEN 
UPDATE EMPLEADOS
SET COMISION=SALARIO*0.02;
END IF;
IF V_SALARIO < 3000 THEN 
UPDATE EMPLEADOS
SET COMISION=SALARIO*0.05;
END IF;
END TRIG_SALARIO;

/*Crea un trigger que cuando se borre una oficina cambie en la tabla empleados aquellos 
cuyo c�digo de oficina es la de la oficina borrada. En los empleados se pondr� la cadena �SIN�*/
CREATE OR REPLACE TRIGGER TRIG_BORRAR_OFI
AFTER DELETE
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
