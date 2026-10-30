# RetailPro | Análisis de datos comerciales con SQL

## Descripción del proyecto

**RetailPro** es un proyecto de análisis de datos comerciales desarrollado con SQL Server. Su objetivo es diseñar una base de datos relacional y utilizar consultas SQL para transformar datos de ventas en información útil para la toma de decisiones comerciales.

El proyecto simula la operación de un negocio de tecnología que comercializa productos de distintas categorías. A partir de los datos de clientes, productos, categorías y ventas, se realizan consultas para analizar el comportamiento comercial, identificar oportunidades y obtener indicadores de rendimiento.

## Objetivos

- Diseñar y construir una base de datos relacional.
- Definir relaciones entre clientes, productos, categorías y ventas.
- Consultar y relacionar información mediante diferentes tipos de `JOIN`.
- Aplicar funciones de agregación para analizar las ventas.
- Identificar los productos con mayor facturación y volumen de unidades vendidas.
- Analizar clientes recurrentes y productos sin ventas.
- Generar indicadores comerciales como facturación total, cantidad de pedidos y ticket promedio.

## Tecnologías y herramientas utilizadas

| Herramienta | Aplicación |
|---|---|
| Microsoft SQL Server | Motor de base de datos relacional. |
| SQL / T-SQL | Creación, manipulación y consulta de datos. |
| SQL Server Management Studio (SSMS) | Entorno recomendado para ejecutar y administrar los scripts. |
| Git | Control de versiones. |
| GitHub | Almacenamiento y documentación del proyecto. |

## Estructura del repositorio

```text
RetailPro/
│
├── Ventas_Tech_DB.sql
│
├── m4_consultas_negocio.sql
│
├── m5_consultas_joins.sql
│
└── README.md
```

### Descripción de los archivos

**1. `Ventas_Tech_DB.sql` — Creación de la base de datos**

Contiene la estructura inicial del proyecto:

- Creación de la base de datos `Ventas_Tech_DB`.
- Creación de las tablas `categorias`, `clientes`, `productos` y `ventas`.
- Definición de claves primarias y foráneas.
- Configuración de restricciones como `NOT NULL`, `UNIQUE` y `DEFAULT`.
- Inserción de registros de ejemplo para realizar las consultas.

**2. `m4_consultas_negocio.sql` — Consultas de análisis comercial**

Incluye consultas orientadas a obtener información relevante para el negocio:

- Resumen ejecutivo mensual.
- Ranking de productos por facturación.
- Identificación de clientes recurrentes.
- Comparación de indicadores de facturación y promedios.

**3. `m5_consultas_joins.sql` — Relaciones y consultas avanzadas**

Contiene ejercicios prácticos para relacionar información de diferentes tablas:

- Consulta general de ventas mediante `LEFT JOIN`.
- Identificación de clientes sin ventas.
- Identificación de productos sin ventas.
- Consolidación de registros mediante `UNION ALL`.

## Modelo de datos

La base de datos está compuesta por cuatro tablas principales:

| Tabla | Descripción |
|---|---|
| `clientes` | Información de los clientes, correo electrónico, ciudad y fecha de registro. |
| `categorias` | Clasificación y descripción de las categorías de productos. |
| `productos` | Catálogo de productos, precios, stock y estado. |
| `ventas` | Registro de las operaciones comerciales, cantidades, precios y fechas. |

### Relaciones entre tablas

- Una categoría puede tener varios productos.
- Un cliente puede registrar varias ventas.
- Un producto puede aparecer en diferentes ventas.
- Cada venta está relacionada con un cliente y un producto.

## Cómo ejecutar el proyecto

### Requisitos previos

- Tener instalado Microsoft SQL Server.
- Contar con SQL Server Management Studio (SSMS) o un entorno compatible para ejecutar consultas T-SQL.
- Descargar o clonar este repositorio.

### 1. Clonar el repositorio

Abrir una terminal y ejecutar:

```bash
git clone https://github.com/JorgePalaciosC/RetailPro.git
```

Ingresar a la carpeta:

```bash
cd RetailPro
```

### 2. Crear la base de datos

Abrir SQL Server Management Studio, conectarse a una instancia de SQL Server y abrir el archivo:

`Ventas_Tech_DB.sql`

Ejecutar el script completo utilizando el botón **Execute** o la tecla `F5`.

Este archivo crea la base de datos, las tablas, sus relaciones y carga los registros de ejemplo.

**Importante:** el script elimina las tablas existentes antes de volver a crearlas. No debe ejecutarse sobre una base de datos con información que se desee conservar. Además, la instrucción `CREATE DATABASE` requiere que la base de datos todavía no exista.

### 3. Ejecutar las consultas comerciales

Una vez creada y poblada la base de datos, abrir:

`m4_consultas_negocio.sql`

Ejecutar las consultas para obtener los indicadores comerciales.

### 4. Ejecutar las consultas con JOIN

Abrir:

`m5_consultas_joins.sql`

Ejecutar las consultas para explorar las relaciones entre tablas, identificar registros sin correspondencia y combinar conjuntos de resultados.

**Nota:** este último script agrega un producto de prueba. Si se ejecuta varias veces, puede insertar registros duplicados.

## Conceptos SQL aplicados

Durante el desarrollo se trabajaron los siguientes conceptos:

- `CREATE DATABASE` y `CREATE TABLE`.
- Claves primarias (`PRIMARY KEY`) y foráneas (`FOREIGN KEY`).
- Restricciones `NOT NULL`, `UNIQUE` y `DEFAULT`.
- Inserción de registros mediante `INSERT INTO`.
- Consultas con `SELECT`, `WHERE` y `ORDER BY`.
- Funciones de agregación: `SUM()`, `COUNT()` y `AVG()`.
- Agrupación de datos mediante `GROUP BY` y `HAVING`.
- Relaciones entre tablas mediante `INNER JOIN` y `LEFT JOIN`.
- Combinación de resultados mediante `UNION ALL`.
- Expresiones calculadas y funciones de fecha.

## Resultados esperados

Al ejecutar los scripts, se obtiene una base de datos funcional y un conjunto de consultas que permiten:

- Conocer la facturación total del negocio.
- Calcular el ticket promedio.
- Identificar los productos con mayor facturación.
- Analizar el volumen de unidades vendidas.
- Detectar clientes recurrentes.
- Identificar productos y clientes sin operaciones registradas.
- Relacionar información comercial para facilitar el análisis.

## Autor

**Jorge Palacios**

Proyecto desarrollado con fines educativos y prácticos para fortalecer conocimientos en bases de datos relacionales, SQL Server y análisis de datos comerciales.

## Repositorio

[GitHub - RetailPro](https://github.com/JorgePalaciosC/RetailPro)
