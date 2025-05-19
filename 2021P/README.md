# Funcionamiento del esquema final:

rst = '1' da lugar a s1, en el cual por definición ct = '0' y por tanto Z = '0'.

Este estado es estable, haste que X = '1', entonces cuando haya un flanco de subida se actualizará a s2.

A partir de que el estado actual es s2, el codigo asíncronamente asigna ld = '1' y en el siguiente flanco de reloj compt copiará el valor de A en q. En este mismo flanco de reloj se cambiará el estado a s3.

El estado s3, en cada flanco de reloj posterior, sumará 1 al valor que tenga en q hasta que llegue a 15. En el flanco de reloj posterior al flanco en el que llega a 15 se asignará s = '0' lo cual cambiará el estado a s1 (que asíncronamente detecta ct para asignarse un '0' que se propaga al instante en la salida).

Y de vuelta s1 es un estado estable.  
