# PRUEBA ANALISTA DE DATOS 

Este proyecto tiene como objetivo resolver 4 fases de la prueba para ser analista de datos en Tuya.
# Estructura solución
## FASE 1
Habilidad extracción datos SQL.
### Solución
Se encuentra en el proyecto un archivo fase_1.sql con la respuesta de los primeros 6 puntos de la fase 1.
#### Punto 7
Por la naturaleza del reto insertar nueva información a la tabla historica agregando una columna sin modificar la tabla original, optaria por la siguiente estrategia 
- Insertar los registros nuevos con las columnas que coinciden en el historial.
- Crear una tabla que se llame historial_extendido en donde insertó netamente la llave de la tabla histórica y el nuevo campo ciudad, de esta forma cuando un cliente necesite obtener los datos del histórico y el nombre de la ciudad deberá realizar un cruce de la tabla historial con historial_extendido

## FASE 2
Se encuentra en el proyecto un archivo llamado fase_2.ipynb con el análisis usado como insumo para las conclusiones expuestas en la presentación.

## FASE 3

Se encuentra en el proyecto un archivo llamado Modelo_clustering.ipynb con el análisis usado como insumo para las conclusiones expuestas en la presentación.


# Requisitos
- Python 3.12 o superior
- pip (gestor de paquetes de Python)
# Instalación
- Clona el repositorio o descarga el código fuente.
- Crea un entorno virtual en windows:
```bash 
python -m venv venv
  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
venv\Scripts\activate
```
- Instala los paquetes requeridos:
```
pip install -r requirements.txt
```
