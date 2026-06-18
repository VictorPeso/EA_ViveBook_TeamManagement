# EA ViveBook TeamManagement

Repositorio auxiliar de gestion del equipo para el proyecto ViveBook.

Este repositorio agrupa materiales comunes del proyecto que no pertenecen directamente al codigo de Backend, Web, APP, BackOffice o despliegue. Su objetivo es centralizar documentos, imagenes, presentaciones y recursos de seguimiento utilizados durante el desarrollo.

## Contenido del repositorio

```text
EA_ViveBook_TeamManagement/
+-- Diagramas/
+-- Grafica de puntos quemados/
+-- horas.xlsx
+-- PuntDeControlPresentacio.pdf
```

## Diagramas

La carpeta `Diagramas/` contiene imagenes y recursos visuales utiles para explicar la estructura o el funcionamiento general del proyecto.

- `Estructura.png`: diagrama de referencia con la estructura general de ViveBook. Sirve como apoyo visual para explicar la organizacion del sistema y la relacion entre sus componentes durante revisiones, presentaciones o entregas.

## Grafica de puntos quemados

Carpeta con scripts MATLAB para elaborar una grafica de seguimiento de puntos quemados durante un sprint.

La finalidad de estos scripts es visualizar el progreso del equipo comparando:

- Puntos iniciales del sprint.
- Puntos quemados por dia.
- Puntos restantes.
- Linea ideal de avance.

Contenido de la carpeta:

```text
Grafica de puntos quemados/
+-- diasEntreFechas.m
+-- plot_burnedpoints.m
+-- plotBurnedPoints2.m
+-- quemar.m
+-- sprint1.txt
```

### `diasEntreFechas.m`

Funcion auxiliar para generar una lista de dias entre dos fechas.

Tambien puede escribir un fichero de texto con las fechas en formato compatible con la grafica, facilitando la preparacion de datos para un nuevo sprint.

### `plot_burnedpoints.m`

Version alternativa/manual de la grafica.

Define los puntos quemados directamente dentro del propio script en lugar de leerlos desde un fichero externo.

Puede ser util para pruebas rapidas o para generar una grafica puntual sin preparar un `.txt`.

### `plotBurnedPoints2.m`

Script principal recomendado para generar la grafica leyendo los datos desde `sprint1.txt`.

Lee las fechas y puntos quemados, calcula los puntos restantes y dibuja:

- Curva real de puntos restantes.
- Linea ideal de quemado.
- Etiquetas por fecha.
- Referencias visuales del total inicial.

### `quemar.m`

Funcion auxiliar que calcula los puntos restantes a partir de:

- Puntos totales.
- Puntos quemados por dia.

Devuelve la evolucion de puntos pendientes tras aplicar los puntos quemados acumulados.

### `sprint1.txt`

Fichero de datos de entrada para la grafica.

Formato esperado:

```text
DD-MM puntos
```

Ejemplo:

```text
06-03 2
07-03 3
08-03 0
```

Cada linea representa los puntos quemados en una fecha concreta.

## `horas.xlsx`

Excel de seguimiento de horas del equipo.

Sirve para registrar, revisar y justificar el tiempo dedicado al proyecto por los miembros del grupo. Es el documento de referencia para la contabilidad de horas y puede utilizarse durante revisiones internas o entregas.

## `PuntDeControlPresentacio.pdf`

Presentacion utilizada en el punto de control del proyecto.

Incluye el material preparado para explicar el estado del proyecto, avances realizados, decisiones tomadas, riesgos, planificacion o cualquier aspecto relevante presentado durante la revision.

## Uso recomendado

- Mantener aqui solo materiales comunes de gestion y seguimiento.
- No incluir codigo fuente de los proyectos principales.
- No incluir informacion sensible, credenciales ni secretos.
- Actualizar los recursos cuando se presenten nuevas entregas o puntos de control.
- Mantener nombres descriptivos para facilitar su consulta por todo el equipo.

## Relacion con otros repositorios

Este repositorio complementa al resto de proyectos de ViveBook:

- Backend.
- Frontend Web.
- Frontend APP.
- BackOffice.
- Deploy.
- Delivery.

Mientras esos repositorios contienen codigo, configuracion de ejecucion o entregables finales, este repositorio queda reservado para documentacion interna y recursos auxiliares del equipo.
