# Template para un repositorio de ejercicios

En este repositorio estaremos hablando de cada uno de los componentes que conforman este template, los cuales son:

- Los workflows.
- Carpetas de ejercicios.
- `Package.json` y `text-exercises.sh`

## Workflows

---

Los workflows son procesos automatizados configurables formados por uno o más trabajos.  
Estos archivos trabajan bajo la sintaxis YAML, es por ello que debe de tener una extensión de archivo `.yml` o `.yaml`.  
Cada uno de estos flujos de trabajo deben de guardarse en el directorio `.github/workflow`.  
En este template tenemos un archivo de ese estilo el cual contiene lo siguiente:

```txt
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [14.x]

    steps:
      - uses: actions/checkout@v2
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v2
        with:
          node-version: ${{ matrix.node-version }}
          cache: "npm"
      - run: npm ci
      - run: npm i -g uadyfmat/test-runner
      - run: npm run build --if-present
      - run: bash test-exercises.sh
```

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

Como mencionamos anteriormente este template consta de una serie de ejercicios los cuales deben de cumplir características específicas. Principalmente para que el sistema reconozca que es un ejercicio, la carpeta debe de tener un prefijo, el cual tenemos definido como `E-`, esta característica es fundamental ya que el archivo `text-exercises.sh` detectará dichos ejercicios, los analizará con el paquete [test-runner](https://github.com/uadyfmat/test-runner) y nos dará un resultado de dicha solución.

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

## `Package.json` y `text-exercises.sh`

---

Para ir concluyendo hablaremos de los últimos archivos que constituyen este template de ejercicios.

Primero hablaremos de los archivos `package.json` y `package-lock.json` estos archivos son de estilo dummy
para que el workflow pueda llevar a cabo la instalación de la paqueteria de node.

Por último tenemos el archivo [text-exercises.sh](https://github.com/uadyfmat/Documentacion-para-ejercicios/blob/main/run.sh)

El cual es el encargado de ir guardando los resultados de los ejercicios e unos archivos temporales en el entorno de linux que montamos para asi verificar las salidas de los programas.
