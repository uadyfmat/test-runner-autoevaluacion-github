# Test Runner: Autoevaluación con GitHub

[Test Runner](https://github.com/uadyfmat/test-runner) funciona en directorios con una estructura particular, donde cada uno de estos directorios representa un ejercicio de programación.

Para conseguir un **mecanismo de auto-evaluación**, se pretende que estos ejercicios se agrupen en repositorios de GitHub con un workflow de GitHub Actions ya configurado. Cada repositorio contiene varios ejercicios.

Aquí se describe lo que los alumnos, profesores y desarrolladores necesitan saber acerca de Test Runner respecto a los repositorios de ejercicios.

## Para alumnos

### Instalación de Test Runner

Antes de utilizar Test Runner, es necesario realizar lo siguiente:

1. [Instala el software necesario para Test Runner](https://github.com/uadyfmat/test-runner#installation-and-usage).
2. [Instala los comandos necesarios para tu lenguaje de preferencia](https://github.com/uadyfmat/test-runner#supported-languages).
3. [Verifica que tu shell y terminal sean adecuados](https://github.com/uadyfmat/test-runner#shells-and-terminals).

**Acerca del punto 3 en Windows:** Teniendo Git Bash ya instalado, poder usarlo en Windows Terminal consiste en modificar un archivo de configuración:

1. Abre Windows Terminal.
2. Abre el archivo de configuración `settings.json`. Para conseguir esto, presiona <kbd>Ctrl+,</kbd>, luego en la barra lateral de la izquierda hasta abajo presiona el botón de abrir el archivo JSON.
3. En la propiedad `"list"` dentro de `"profiles"`, agrega el siguiente objeto como primer elemento del arreglo:

```text
{
    "commandline": "%PROGRAMFILES%/git/usr/bin/bash.exe -i -l",
    "guid": "{00000000-0000-0000-ba54-000000000002}",
    "icon": "%PROGRAMFILES%/Git/mingw64/share/git/git-for-windows.ico",
    "name": "Git Bash",
    "startingDirectory": "%USERPROFILE%"
},
```

Es posible que sea necesario modificar la ruta en `"commandline"` y `"icon"`, en caso que no se encuentren ahí el ejecutable o el ícono, aunque por defecto ahí se deberían encontrar.

<details>
<summary>Ejemplo de un <code>settings.json</code> completo.</summary>

```json
{
    "$schema": "https://aka.ms/terminal-profiles-schema",
    "actions":
    [
        {
            "command": 
            {
                "action": "copy",
                "singleLine": false
            },
            "keys": "ctrl+c"
        },
        {
            "command": "paste",
            "keys": "ctrl+v"
        },
        {
            "command": "find",
            "keys": "ctrl+shift+f"
        },
        {
            "command": 
            {
                "action": "splitPane",
                "split": "auto",
                "splitMode": "duplicate"
            },
            "keys": "alt+shift+d"
        }
    ],
    "copyFormatting": "none",
    "copyOnSelect": false,
    "defaultProfile": "{00000000-0000-0000-ba54-000000000002}",
    "profiles": 
    {
        "defaults": 
        {
            "closeOnExit": "always",
            "colorScheme": "deep",
            "fontFace": "Consolas"
        },
        "list":
        [
            {
                "commandline": "%PROGRAMFILES%/git/usr/bin/bash.exe -i -l",
                "guid": "{00000000-0000-0000-ba54-000000000002}",
                "icon": "%PROGRAMFILES%/Git/mingw64/share/git/git-for-windows.ico",
                "name": "Git Bash",
                "startingDirectory": "%USERPROFILE%"
            },
            {
                "commandline": "cmd.exe",
                "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
                "hidden": false,
                "name": "S\u00edmbolo del sistema"
            },
            {
                "commandline": "powershell.exe",
                "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                "hidden": false,
                "name": "Windows PowerShell"
            }
        ]
    },
    "schemes": 
    [
        {
            "background": "#090909",
            "black": "#000000",
            "blue": "#5665FF",
            "brightBlack": "#535353",
            "brightBlue": "#9FA9FF",
            "brightCyan": "#8DF9FF",
            "brightGreen": "#22FF18",
            "brightPurple": "#E09AFF",
            "brightRed": "#FB0007",
            "brightWhite": "#FFFFFF",
            "brightYellow": "#FEDC2B",
            "cursorColor": "#D0D0D0",
            "cyan": "#50D2DA",
            "foreground": "#CDCDCD",
            "green": "#1CD915",
            "name": "deep",
            "purple": "#B052DA",
            "red": "#D70005",
            "selectionBackground": "#D2D2D2",
            "white": "#E0E0E0",
            "yellow": "#D9BD26"
        }
    ],
    "theme": "dark"
}
```

</details>

### Uso de Test Runner

Teniendo el repositorio de ejercicio propio tras haber aceptado un assignment de GitHub Classroom, es necesario clonarlo con Git y abrirlo en algún editor de texto. Se sugiere [Visual Studio Code](https://code.visualstudio.com/).

Para correr el Test Runner sobre alguno de los ejercicios, correr el siguiente comando en una terminal abierta en el directorio del repositorio clonado:

```text
test-runner <nombre de la carpeta>
```

Por ejemplo: `test-runner 03-palindromos`

Cada directorio de ejercicio tiene la siguiente estructura:

```txt
03-palindromos
├── README.md              // Lo crea el profesor. Aquí se proporciona
|                          // una descripción acerca del ejercicio.
|
├── Solution.java,py,etc.  // Lo crea el estudiante. Es la solución de
|                          // acuerdo a lo descrito en el README.md.
|
└── spec.inout             // Lo crea el profesor, por favor no modificar.
                           // Indica cuáles son los casos de prueba.
```

Tras agregar una solución, Test Runner ya corre los casos de prueba del spec.inout y ofrecer retroalimentación acerca de cuáles pasan y cuáles no.

### Auto-evaluación de los ejercicios en GitHub

Tras crear la solución para tus ejercicios y verificar con el Test Runner que son correctas, puedes subir cambios a GitHub donde se auto-evaluarán igualmente usando el Test Runner.

Para realizar esto, crea un commit con tus cambios y realiza push a la rama principal. En GitHub, al lado de tu último commit verás una palomita o tachita. Da click en ella, luego en "Details" y abre el apartado que lee `Run bash test-exercises`.

### Explicación en video

De ser necesario, puedes ver este video de YouTube donde se explica paso a paso el uso de Test Runner sobre un repo de ejercicios.

Video de YouTube: <https://youtu.be/e9aIrrjx3kA>

## Para profesores

Video en YouTube de explicación para profesores: <https://youtu.be/clPdSuhGwM4>

Adicionalmente:

- [Explicación del formato de `spec.inout`](https://github.com/uadyfmat/test-runner#test-cases-file-specinout)

// TODO: Otros links útiles (repo base para crear ejercicios, plantilla de README.md, etc.)

## Para desarrolladores

### Proyecto Test Runner

Repositorio de Test Runner: <https://github.com/uadyfmat/test-runner>

### Workflows

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


### Carpetas de ejercicios

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

### `Package.json` y `test-exercises.sh`

Para ir concluyendo hablaremos de los últimos archivos que constituyen este template de ejercicios.

Primero hablaremos de los archivos `package.json` y `package-lock.json` estos archivos son de estilo dummy
para que el workflow pueda llevar a cabo la instalación de la paqueteria de node.

Por último tenemos el archivo [test-exercises.sh](https://github.com/uadyfmat/Documentacion-para-ejercicios/blob/master/test-exercises.sh)

El cual es el encargado de ir guardando los resultados de los ejercicios e unos archivos temporales en el entorno de linux que montamos para asi verificar las salidas de los programas.

### Ejemplos

Para ver los ejemplos de los repositorios pueden ver los siguientes link, para que puedan analizar la organización de las mismas

- [Repositorio de ejercicios de un maestro](https://github.com/uadyfmat/Unidad-l)
- [Repositorio de un alumno](https://github.com/uadyfmat/unidad-l-JoseBaezaP)
- [Template para utilzar un githubn classroom](https://github.com/uadyfmat/Template-sin-ejercicios)
