# Mundo Chiquito

Este proyecto implementa en **Prolog** la lógica de la carta *Mundo Chiquito* del Juego de Cartas Coleccionables **Duelo de Cartas de Mostro**.  

---

## Integrantes

* Nombres: (Leonardo Dolande, Cristina Gómez)

* Carnets: (19-10181, 19-10266)

---

## Como compilar y ejecutar

1. Inicia SWI-Prolog escribiendo `swipl` en la terminal.

2. Carga el archivo principal del proyecto escribiendo el siguiente comando en la consola de Prolog:

   ```prolog
   ?- [mundo_chiquito].
   ```

3. Para ejecutar uno de los predicados principales escribe el comando seguido de un punto. Por ejemplo, para ejecutar el predicado `mundoChiquito`, escribe:

   ```prolog
   ?- mundoChiquito.
   ```


## Descripción

Cada carta **mostro** tiene las siguientes características:
- **Nombre único**
- **Nivel**: Número entero entre 1 y 12
- **Atributo**: (Agua, fuego, viento, tierra, luz, oscuridad, divino)
- **Poder**: número entero positivo múltiplo de 50

La carta *Mundo Chiquito* permite:
1. Revelar un mostro de la mano.
2. Buscar en el mazo un mostro que comparta **exactamente una característica** (nivel, atributo o poder).
3. Agregar a la mano un mostro que comparta **exactamente una característica** con el mostro revelado del mazo.

Este proyecto modela esa lógica en Prolog.

---

## Estructura del código

- **Base de conocimiento**

Contiene hechos que representan las cartas mostro disponibles. Cada carta se representa con el predicado `mostro/4`:

```prolog
mostro(Nombre, Nivel, Atributo, Poder).
```
## Predicados

`mundoChiquito/0`: Predicado que impreme en pantalla todas las terna de cartas que cumplen con las condiciones del mundo chiquito.


Funciona llamando a `ternaMundoChiquito/3` para encontrar todas las combinaciones posibles de tres cartas mostro (C1, C2, C3) y usa `write/1` para imprimir cada combinación en la consola. El uso de `fail` fuerza a Prolog a buscar todas las soluciones posibles, y el predicado termina cuando no hay más soluciones.



`agregarMostro/0`: Permite agregar nuevas cartas mostro a la base de conocimiento.

Funciona solicitando al usuario que ingrese los detalles de la nueva carta (nombre, nivel, atributo y poder), luego verifica que los datos sean válidos y luego utiliza `assertz/1` para agregar el nuevo hecho `mostro/4` a la base de conocimiento.


`ternaMundoChiquito`: Predicado que calcula las ternas de cartas que cumplen con las condiciones del mundo chiquito. 

Funciona seleccionando tres cartas mostro diferentes (C1, C2, C3) y verificando que compartan exactamente una característica (nivel, atributo o poder) entre C1 y C2, y entre C1 y C3, pero no entre C2 y C3. Esta verificación se realiza mediante el predicado auxiliar `comparteUnaCaracteristica/3`.

`comparteUnaCaracteristica/3`: Predicado auxiliar que verifica si dos cartas comparten exactamente una característica (nivel, atributo o poder).

Funciona comparando las características de las dos cartas y contando cuántas coinciden. Retorna verdadero si exactamente una característica coincide.
