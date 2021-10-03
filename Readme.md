# Template para un repositorio de ejercicios

En este repositorio estaremos hablando de cada uno de los componentes que conforman este template, los cuales son:

- Los workflows.
- Carpetas de ejercicios.
- `Package.json` y `test-exercises.sh`

## Workflows

---

Los workflows son procesos automatizados configurables formados por uno o más trabajos.  
Estos archivos trabajan bajo la sintaxis YAML, es por ello que debe de tener una extensión de archivo `.yml` o `.yaml`.  
Cada uno de estos flujos de trabajo deben de guardarse en el directorio `.github/workflow`.

Para poder ver el contenido de este archivo, puedes dar click en el siguiente [enlace](https://github.com/uadyfmat/Ejemplo-template-de-ejercicios/blob/master/.github/workflows/blank.yml).

En pocas palabras este workflow esta constitudo de 3 secciones:

- El nombre del workflow,
- Un apartado en el cual se especifica en que momento se llevará acabo dicho workflow.
- Los `jobs`
  - El cual se encarga de montar nuestro entorno virtual, el cual puede ser linux, mac o windows.
  - En este apartado igual se pueden definir cada uno de los pasos que se llevarán acabo.

Como podemos observar este workflow tiene unos steps fundamentales, los cuales nos ayudarán a llevar a cabo este trabajo de automatización.  
En primera instancia como estaremos trabajando con distintas paqueterias de Node, tenemos que montar en nuestro entorno virtual todo el setup de node, en el cual podemos especificar una version para utilizar y asi instalar lo necesario.
Por otro lado tenemos los `steps` los cuales son pieza fundamental en esto ya que para este trabajo, necesitamos instalar una paquetería de node, la cual fue desarrollada por alumnos de la Universidad Autónoma de Yucatán, para luego correr un archivo `bash` que nos ayuda a ir ejecutando cada una de las soluciones a los ejercicios creados en este repositorio.

Para más imformación sobre el paquete de node, consulta [test-runner](https://github.com/uadyfmat/test-runner).

## Carpetas de ejercicios

---

Como mencionamos anteriormente este template consta de una serie de ejercicios los cuales deben de cumplir características específicas. Principalmente para que el sistema reconozca que es un ejercicio, la carpeta debe de tener un prefijo, el cual tenemos definido como `E-`, esta característica es fundamental ya que el archivo `test-exercises.sh` detectará dichos ejercicios, los analizará con el paquete [test-runner](https://github.com/uadyfmat/test-runner) y nos dará un resultado de dicha solución.

Una vez concluido con el elemento anterior podemos fijarnos en el contenido de dichas carpetas, estas deben de contener lo siguiente:

```txt
.
└── E-EntreLimites
    ├── README.md (optional)
    ├── Solution.java
    └── spec.inout
```

Como podemos ver los ejercicios deben contener 3 archivos, de los cuales 2 son muy necesarios, el `spec.inout` es en donde el profesor tendrá que definir las entradas y salidas para dicho ejercicio.

Para más información, consulta [archivo spec.inout](https://github.com/uadyfmat/test-runner#test-cases-file-specinout).

El archivo `Solution.extension`, el cual el alumno será el encargado de crear dicho archivo.

Finalmente esta en el archivo `Readme.md` en donde el maestro podrá hablar un poco sobre las caracteristicas del ejercicio, datos de entrada y datos de salida.

## `Package.json` y `test-exercises.sh`

---

Para ir concluyendo hablaremos de los últimos archivos que constituyen este template de ejercicios.

Primero hablaremos de los archivos `package.json` y `package-lock.json` estos archivos son de estilo dummy
para que el workflow pueda llevar a cabo la instalación de la paqueteria de node.

Por último tenemos el archivo [test-exercises.sh](https://github.com/uadyfmat/Documentacion-para-ejercicios/blob/master/test-exercises.sh)

El cual es el encargado de ir guardando los resultados de los ejercicios e unos archivos temporales en el entorno de linux que montamos para asi verificar las salidas de los programas.
