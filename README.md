# Test Runner: Auto-evaluaci贸n con GitHub

[Test Runner](https://github.com/uadyfmat/test-runner) funciona en directorios con una estructura particular, donde cada uno de estos directorios representa un ejercicio de programaci贸n.

Para conseguir un **mecanismo de auto-evaluaci贸n**, se pretende que estos ejercicios se agrupen en repositorios de GitHub con un workflow de GitHub Actions ya configurado. Cada repositorio contiene varios ejercicios.

Aqu铆 se describe lo que los alumnos, profesores y desarrolladores necesitan saber acerca de Test Runner respecto a los repositorios de ejercicios.

馃椇 脥ndice de contenidos:

- [Documentaci贸n para **alumnos**](#para-alumnos)
- [Documentaci贸n para **profesores**](#para-profesores)
- [Documentaci贸n para **desarrolladores**](#para-desarrolladores)
- [Problemas frecuentes](#problemas)

## <a name="para-alumnos">Para alumnos</a> [&#8593;](#test-runner-auto-evaluaci贸n-con-github)

Para resolver los ejercicios de programaci贸n y poder obtener retroalimentaci贸n acerca de las soluciones, se require:

1. Instalar Test Runner y el software del que depende.
2. Usar Test Runner para probar las soluciones localmente.
3. Ver en GitHub la auto-evaluaci贸n del repositorio.

馃帴 Puede referirse a una **[explicaci贸n en video](https://youtu.be/YV7xHDyxMRs)** donde se abarcan los pasos, o alternativamente a continuaci贸n se describe cada paso.

### 1. Instalaci贸n de Test Runner

Antes de utilizar Test Runner, es necesario realizar lo siguiente:

1. [Instala el software necesario para Test Runner](https://github.com/uadyfmat/test-runner#installation-and-usage).
2. [Instala los comandos necesarios para tu lenguaje de preferencia](https://github.com/uadyfmat/test-runner#supported-languages).
3. [Verifica que tu shell y terminal sean adecuados](https://github.com/uadyfmat/test-runner#shells-and-terminals).

**Acerca del punto 3 en Windows:** Teniendo Git Bash ya instalado, poder usarlo en Windows Terminal consiste en modificar un archivo de configuraci贸n:

1. Abre Windows Terminal.
2. Abre el archivo de configuraci贸n `settings.json`. Para conseguir esto, presiona <kbd>Ctrl+,</kbd>, luego en la barra lateral de la izquierda hasta abajo presiona el bot贸n de abrir el archivo JSON.
3. En la propiedad `"list"` dentro de `"profiles"`, agrega el siguiente objeto como primer elemento del arreglo:

```text
{
    "commandline": "%PROGRAMFILES%/git/usr/bin/bash.exe -i -l",
    "guid": "{00000000-0000-0000-ba54-000000000002}",
    "icon": "%PROGRAMFILES%/Git/mingw64/share/git/git-for-windows.ico",
    "name": "Git Bash",
    "startingDirectory": "%USERPROFILE%"
}
```

Es posible que sea necesario modificar la ruta en `"commandline"` y `"icon"`, en caso que no se encuentren ah铆 el ejecutable o el 铆cono, aunque por defecto ah铆 se deber铆an encontrar.

<details>
<summary>Ejemplo de un <code>settings.json</code> completo.</summary>

```json
{
  "$schema": "https://aka.ms/terminal-profiles-schema",
  "actions": [
    {
      "command": {
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
      "command": {
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
  "profiles": {
    "defaults": {
      "closeOnExit": "always",
      "colorScheme": "deep",
      "fontFace": "Consolas"
    },
    "list": [
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
  "schemes": [
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

Una vez analizado el Json con la configuraci贸n anterior les recomendamos analizar la linea `defaultProfile` debido a que esta tiene que considir con el gui que acaban de agregar del `git bash` para que al momento de abrir windows terminal este pueda abrir en primera instancia este, para que asi puedan utilizar los comando correspondientes.

### 2. Uso de Test Runner

Teniendo el repositorio de ejercicio propio tras haber aceptado un assignment de GitHub Classroom, es necesario clonarlo con Git y abrirlo en alg煤n editor de texto. Se sugiere [Visual Studio Code](https://code.visualstudio.com/).

Para correr el Test Runner sobre alguno de los ejercicios, correr el siguiente comando en una terminal abierta en el directorio del repositorio clonado:

```text
test-runner <nombre de la carpeta>
```

Por ejemplo: `test-runner 03-palindromos`

Cada directorio de ejercicio tiene la siguiente estructura:

```txt
03-palindromos
鈹溾攢鈹? README.md           // Lo crea el profesor. Aqu铆 se proporciona
|                       // una descripci贸n acerca del ejercicio.
|
鈹溾攢鈹? Solution.java,etc.  // Lo crea el alumno. Es la soluci贸n de
|                       // acuerdo a lo descrito en el README.md.
|
鈹斺攢鈹? spec.inout          // Lo crea el profesor, por favor no modificar.
                        // Indica cu谩les son los casos de prueba.
```

Para el archivo de soluci贸n puedes elegir entre alguno de [estos lenguajes](https://github.com/uadyfmat/test-runner#supported-languages).

Tras agregar una soluci贸n, Test Runner puede corre los casos de prueba del spec.inout contra la soluci贸n y ofrecer retroalimentaci贸n acerca de cu谩les pasan y cu谩les no.

Cabe resaltar que el test-runner busca tener un match exacto, es decir, que la salida que ustedes obtengan, debe ser exactamente igual a la salida esperada, debido a que su soluci贸n da `65.0` y el test-runner espera `65` este marcar谩 como erronia sus soluci贸n.

Aqu铆 hay un ejemplo de un repositorio de ejercicios cuyas soluciones son correctas:<br/> <https://github.com/uadyfmat/programacion-estructurada-unidad-1-HerCerM>

### 3. Auto-evaluaci贸n de los ejercicios en GitHub

Tras crear la soluci贸n para tus ejercicios y verificar con el Test Runner que son correctas, puedes subir cambios a GitHub donde se auto-evaluar谩n igualmente usando el Test Runner.

Para realizar esto, crea un commit con tus cambios y realiza push a la rama principal. En GitHub, al lado de tu 煤ltimo commit ver谩s una palomita o tachita. Da click en ella, luego en "Details" y abre el apartado que lee `Run bash test-exercises`; ah铆 podr谩s observar cu谩les ejercicios tienen una soluci贸n correcta y cu谩les no. Esto es lo que el profesor ver谩 al calificar.

<p align="center">
    <img src="./resources/images/gh_autograding_output.png" width="675px" />
</p>

Si deseas correr el mismo script que se corre en GitHub Actions (que igualmente usa Test Runner) para probar todos los ejercicios, puedes ejecutar el siguiente comando en la terminal abierta en la ra铆z del repositorio de ejercicios. Esto es equivalente a correr Test Runner manualmente sobre cada carpeta de ejercicio.

```text
curl -o- https://raw.githubusercontent.com/uadyfmat/test-runner-autoevaluacion-github/main/resources/test-exercises | bash
```

## <a name="para-profesores">Para profesores</a> [&#8593;](#test-runner-auto-evaluaci贸n-con-github)

Para aplicar ejercicios de programaci贸n a alumnos es necesario realizar lo siguiente:

1. Crear el repositorio de ejercicios en GitHub.
2. Agregar los ejercicios al repositorio.
3. Crear el assignment en GitHub Classroom.
4. Compartir el assignment con los alumnos.
5. Al momento de evaluar, ver ejercicios correctos de cada alumno.

馃帴 Puede referirse a una **[explicaci贸n en video](https://youtu.be/roAd5zSw-Os)** donde se abarcan los pasos, o alternativamente a continuaci贸n se describe cada paso.

### 1. Crear el repositorio de ejercicios en GitHub

<table>
  <tr>
    <td>
鈩? GitHub es una plataforma para almacenar, explorar, gestionar y colaborar en repositorios del sistema de control de versiones 芦Git禄. Usualmente, al trabajar con estos repositorios, se descargan localmente y realizan ediciones en un editor de texto de preferencia. Tras tener cambios que se quieran compartir, se usa la herramienta de l铆nea de comandos de Git para empujar cambios a GitHub.<br/><br/>
Para el profesor, se considera que el flujo de trabajo no sea este, sino que basta con utilizar la <strong>interfaz gr谩fica de GitHub</strong> para realizar todos los pasos. Aunque de ser de su preferencia, es posible realizar las ediciones localmente.
    </td>
  </tr>
</table>

Primero, es necesario haber iniciado sesi贸n en GitHub con su cuenta personal. En caso que no tenga cuenta, es necesario crearla.

El repositorio de ejercicios se crea como cualquier otro repositorio en GitHub, presionando el s铆mbolo de **+** en la barra de navegaci贸n y eligiendo _nuevo repositorio_.

Es importante considerar lo siguiente:

- Seleccionar [`uadyfmat/test-runner-plantilla-base`](https://github.com/uadyfmat/test-runner-plantilla-base) como plantilla del repositorio. 脡ste contiene el workflow de GitHub Actions que permite la auto-evaluaci贸n, ofrece una [plantilla para la descripci贸n de los ejercicio](https://github.com/uadyfmat/test-runner-plantilla-base/blob/main/PLANTILLA_README.md) y un [ejemplo de archivo `spec.inout`](https://github.com/uadyfmat/test-runner-plantilla-base/blob/main/EJEMPLO_spec.inout).

<p align="center">
    <img src="./resources/images/base_template_selection.png" width="275px" />
</p>

- Seleccionar **uadyfmat** como due帽o del repositorio. Esto hace que el repositorio pertenezca a la organizaci贸n de GitHub de FMAT. En caso que no vea la opci贸n para seleccionar la organizaci贸n, es necesario contactarse con Edgar Cambranes para que agregue su cuenta de GitHub a la organizaci贸n y le coloque el rol de **Owner**.

<p align="center">
    <img src="./resources/images/repo_owner_selection.png" width="425px" />
</p>

En adici贸n que el repo es generado de una plantilla, 茅ste igualmente **debe ser una plantilla**. Para conseguir esto 煤ltimo, dir铆jase a configuraciones y marque el checkbox de plantilla de su repo reci茅n creado.

<p align="center">
    <img src="./resources/images/template_checkbox.png" width="675px" />
</p>

### 2. Agregar ejercicios en el repositorio

Cada ejercicio corresponde a una carpeta nueva en el repositorio. Por lo tanto, agregar ejercicios consiste en agregar estas carpetas, cada una de las cuales debe tener un archivo **README.md** y un **spec.inout**.

Para poder indicar un orden de los ejercicios, el nombre de cada una de estas carpetas debe iniciar con dos n煤meros seguido de un gui贸n alto y el nombre del ejercicio, por ejemplo `03-palindromos`. Dentro de cada una de las carpetas es importante colocar un archivo nombrado README.md, para que los alumnos sepan de qu茅 trata el ejercicio, y otro archivo nombrado `spec.inout`, para que la herramienta Test Runner tenga casos de prueba contra los cuales probar la soluci贸n de los alumnos.

Por cada carpeta de ejercicio (que en este caso es 03-palindromos de ejemplo) as铆 se debe ver la organizaci贸n de archivos:

```txt
03-palindromos
鈹溾攢鈹? README.md           // Lo crea el profesor. Aqu铆 se proporciona
|                       // una descripci贸n acerca del ejercicio.
|
鈹斺攢鈹? spec.inout          // Lo crea el profesor. Indica cu谩les son
                        // los casos de prueba del ejercicio.
```

- La estructura del `README.md` es libre, sin embargo se ofrece una [plantilla de gu铆a](https://github.com/uadyfmat/test-runner-plantilla-base/blob/main/PLANTILLA_README.md).
- La estructura del `spec.inout` [est谩 documentada](https://github.com/uadyfmat/test-runner#test-cases-file-specinout), igualmente se ofrece un [ejemplo de un `spec.inout` v谩lido](https://github.com/uadyfmat/test-runner-plantilla-base/blob/main/EJEMPLO_spec.inout).

Para crear los directorios y archivos, puede utilizar la interfaz gr谩fica de GitHub o bien clonar el repositorio y usar su editor de texto de preferencia. **Nosotros recomendamos usar la interfaz gr谩fica de GitHub**. Todos los cambios se deben hacer sobre la rama principal: `main`.

馃帴 En el **[video de explicaci贸n](https://youtu.be/roAd5zSw-Os)** puede ver una demostraci贸n de c贸mo se crean los ejercicios usando la interfaz gr谩fica de GitHub.

Tras a帽adir los ejercicios, el repositorio se debe ver como el ejemplo [`uadyfmat/ejemplo-progr-estructurada-u1`](https://github.com/uadyfmat/ejemplo-progr-estructurada-u1). Es correcto que el workflow est茅 fallando, tras que el alumno a帽ada sus soluciones debe pasar.

### 3. Crear el assignment en GitHub Classroom

<table>
  <tr>
    <td>
鈩? GitHub Classroom es una plataforma en la cual se pueden crear tareas (<i>assignments</i>) de programaci贸n asociadas a un curso (<i>classroom</i>). Cada una de estas tareas parte de un repositorio plantilla de GitHub (en este caso, el creado en el paso 1). Cuando un alumno acepta la tarea, se le crea su propio repositorio que inicia en el estado de la plantilla. Aqu铆, el alumno trabaja para entregar su soluci贸n.
    </td>
  </tr>
</table>

Dir铆gase a <https://classroom.github.com/>, y si no tiene su sesi贸n iniciada (no ve su foto de perfil en la parte superior derecha), inicie sesi贸n con su cuenta personal de GitHub, que es la misma que us贸 para el paso 1.

Si no tiene un classroom ya creado en el cual quiera colocar los ejercicios, presione el bot贸n de **New Classroom** para crear uno nuevo y seleccione **uadyfmat** como la organizaci贸n. El nombre del classroom es libre, pero idealmente hace referencia a su asignatura, por ejemplo "programaci贸n-estructurada".

<p align="center">
    <img src="./resources/images/gh_classroom_new_classroom_button.png" width="675px" />
</p>

Tras tener un classroom creado, entre al mismo y presione el bot贸n de **New Assignment**, con esto se inicia el proceso de creaci贸n, el cual consta de 3 vistas.

En la primera vista s贸lo es necesario colocar el t铆tulo del assignment.

<p align="center">
    <img src="./resources/images/gh_classroom_create_view_1.png" width="650px" />
</p>

En la segunda vista es necesario indicar la plantilla del assignment. Se selecciona el repositorio **que usted cre贸** con sus ejercicios (el creado en el paso 1). En la siguiente captura de pantalla, se muestra de ejemplo `uadyfmat/ejemplo-progr-estructurada-u1`.

<p align="center">
    <img src="./resources/images/gh_classroom_create_view_2.png" width="650px" />
</p>

En la 煤ltima vista s贸lo se presiona el bot贸n de crear el assignment.

<p align="center">
    <img src="./resources/images/gh_classroom_create_view_3.png" width="650px" />
</p>

### 4. Compartir el assignment con los alumnos

Una vez creado el assignment, sigue compartirlo con los alumnos para que puedan empezar a resolverlo.

Entre al assignment que cre贸. Para compartirlo basta con compartir el URL de invitaci贸n del mismo. Copie el URL y distrib煤yalo por el medio que considere m谩s conveniente.

<p align="center">
    <img src="./resources/images/assignment_invitation_link.png" width="675px" />
</p>

### 5. Ver ejercicios correctos por alumno

Los alumnos que hayan dado click al URL que usted les comparti贸 y hayan aceptado la invitaci贸n al assignment, empezar谩n a aparecer en la secci贸n debajo de **Assignment submissions**. En la captura inferior, HerCerM es el 煤nico alumno que ha aceptado la invitaci贸n.

Para revisar qu茅 ejercicios tienen correctos los alumnos, actualmente es necesario entrar al repositorio de cada alumno, uno por uno, presionando el bot贸n de **Go to repo**.

<p align="center">
    <img src="./resources/images/gh_classroom_student_repo.png" width="675px" />
</p>

Una vez en el repositorio de un alumno, se puede consultar la informaci贸n de la 煤ltima auto-evaluaci贸n al presionar la palomita o tachita, seguido de **Details**.

<p align="center">
    <img src="./resources/images/see_ci_results.png" width="675px" />
</p>

Luego, expanda el apartado titulado **Run bash test-exercises** para ver el resultado de la auto-evaluaci贸n.

<p align="center">
    <img src="./resources/images/gh_autograding_output.png" width="675px" />
</p>

El repositorio de las capturas de pantalla lo puede encontrar en el siguiente URL, donde podr谩 ver el resultado de la auto-evaluaci贸n y as铆 tener una noci贸n m谩s pr谩ctica de c贸mo encontrarlo.<br/>
<https://github.com/uadyfmat/programacion-estructurada-unidad-1-HerCerM>

## <a name="para-desarrolladores">Para desarrolladores</a> [&#8593;](#test-runner-auto-evaluaci贸n-con-github)

### Proyecto Test Runner

Repositorio de Test Runner, incluyendo c贸digo y documentaci贸n: <https://github.com/uadyfmat/test-runner>

### Workflow de GitHub Actions

Los workflows son procesos automatizados configurables formados por uno o m谩s trabajos. Estos archivos trabajan bajo la sintaxis YAML, es por ello que debe de tener una extensi贸n de archivo `.yml` o `.yaml`. Cada uno de estos flujos de trabajo deben de guardarse en el directorio `.github/workflow`.

Para poder ver el contenido de este archivo, puedes dar click en el siguiente [enlace](https://github.com/uadyfmat/test-runner-plantilla-base/blob/main/.github/workflows/default.yml).

En pocas palabras este workflow esta constitudo de 3 secciones:

- El nombre del workflow,
- Un apartado en el cual se especifica en que momento se llevar谩 acabo dicho workflow.
- Los `jobs`
  - El cual se encarga de montar nuestro entorno virtual, el cual puede ser linux, mac o windows.
  - En este apartado igual se pueden definir cada uno de los pasos que se llevar谩n acabo.

Como podemos observar este workflow tiene unos steps fundamentales, los cuales nos ayudar谩n a llevar a cabo este trabajo de automatizaci贸n.

En primera instancia como estaremos trabajando con distintas paqueterias de Node, tenemos que montar en nuestro entorno virtual todo el setup de node, en el cual podemos especificar una version para utilizar y asi instalar lo necesario.

Por otro lado tenemos los `steps` los cuales son pieza fundamental en esto ya que para este trabajo, necesitamos instalar una paqueter铆a de node, la cual fue desarrollada por alumnos de la Universidad Aut贸noma de Yucat谩n, para luego correr un archivo `bash` que nos ayuda a ir ejecutando cada una de las soluciones a los ejercicios creados en este repositorio.

### `test-exercises`

[test-exercises](./resources/test-exercises) es un script de Bash utilizado para ejecutar Test Runner sobre todos los ejercicios de un repositorio; es usado por el [workflow](<(https://github.com/uadyfmat/test-runner-plantilla-base/blob/main/.github/workflows/default.yml)>) de la plantilla base de ejercicios.

Con el objetivo de honrar el principio de _single source of truth_, este script se encuentra 煤nicamente en este repositorio y los dem谩s que lo utilizan lo descargan por medio de `curl`.

## <a name="problemas">Problemas frecuentes</a> [&#8593;](#test-runner-auto-evaluaci贸n-con-github)

Al realizar pruebas de este sistema con un grupo de estudiantes, nos encontramos con un conjunto de problemas a los cuales le logramos encontrar una soluci贸n. A continuaci贸n, le presentamos los problemas encontrados y sus soluciones.

### 1. Instalaci贸n de NodeJs

En ciertos casos al momento de instalar NodeJs usando la terminal de ZSH, esta no las guarda en las variables de entorno y nosotros manualmente debemos escribir el path npm para asi poder utilizar NodeJs de forma global.

Para m谩s informaci贸n les invitamos visitar el siguiente [`Enlace`](https://dev.to/emmanuellesoy/como-configurar-un-path-global-de-npm-con-zsh-300d) el cual presenta un tutorial basta claro a la suluci贸n de este problema.

Notas a destacar:

- En el tutorial anteriormente mensionado como que se debe de crear una carpeta en ra铆z llamada node-global sin embargo en ciertos casos, ustedes pueden ya tenerla creada o llamada como node-gyp, pero como pueden saber si tiene o no esta carpeta, no se alarmen, el proceso es bastante sencillo, solo tiene que hacer los siguiente, en primera instacia debes de escribir `cd` para que te lleve a tu raiz, una ves hecho esto sigue los siguientes comandos para saber si tienes alguna carpeta de global de node o no.

```text
cd
ls -a | grep -E "npm"
```

Una vez hecho esto, obtendras una resultado como el siguiente:

<p align="center">
    <img src="./resources/images/npm-global.jpg" width="675px" />
</p>

En mi caso podemos ver que mi carpeta global es .nppm-global entonces puedo seguir con todos los pasos de tutorial desp煤es de ese apartado de crear la carpeta, en dado caso a ustedes tengan .npm-gyp, sigan el proceso solo que cambiando npm-global por npm-gyp.

Para evitar la mayor cantidad de problemas con la instalaci贸n, se les recomienda utilizar un gestor paquetes como chocolatey en windows, nvm para Linux y Brew para MacOs, en cualquiera de los casos puedes visitar el siguiente [enlace](https://nodejs.org/es/download/package-manager) la cual proviene de la misma documentaci贸n de NodeJs.

### 2. Problemas con las salidas

Anteriormente se les a comentado, sin embargo no esta de m谩s recordarselos, al momento crear alguna soluci贸n para alguna actividad, deben de tener mucho cuidado al momento de obterner sus outputs debedido a que si el problema debe de espera una salida entera como `65` y sus soluci贸n esta imprimiendo `65.0` esta estar谩 marcado un error, debido a que el sistema trabaja en base a encontrar una relacion entre sus salida y la salida esperada, es por ello que hacemos bastante incapie en esto para evitar que obtengan una mala calificaci贸n o alg煤n problema en sus resultados.馃槈

### 3. Nombre del archivo Solution.ext

En ciertas ocasiones al momento de subir nuestra soluci贸n se nos puede pasar poner el nombre correcto, a que nos referimos con esto, el test-runner al momento de buscar entre las carpetas buscar un archivo llamado `Solution.tuExtencion` y como podemos ver `Solution` esta escrito con una `S` may煤scula, entonces si no lo escriben as铆 el test-runner no detectar谩 tu soluci贸n y este estar谩 marcando error.

### 4. Terminal a utilizar

Al momento de utilizar nuestras terminales hay que tener algo de cuidado, debido a que al menos en windows podemos terner hasta 3 terminales las cuales ya vienen instaladas por defecto, sin embargo la que m谩s nos interesa es la que te acabamos de instalar, llamada windows terminal.

<p align="center">
    <img src="./resources/images/windows-terminal.jpg" width="675px" />
</p>

Ya que esta nos facilitara bastante a poder analizar bien las salidas obtenidas por el test-runner.
