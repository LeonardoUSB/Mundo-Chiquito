:- dynamic mostro/4.

% mostro(nombre, nivel, atributo, poder).
mostro(mostroUno, 5, luz, 2100).
mostro(mostroDos, 7, luz, 2400).
mostro(mostroTres, 7, viento, 2500).

% ternaMundoChiquito(X, Y, Z) :- ...
% ternaMundoChiquito(CartaMano, CartaMazo, CartaAgregada)
ternaMundoChiquito(C1, C2, C3) :-
    mostro(C1, N1, A1, P1),
    mostro(C2, N2, A2, P2),
    mostro(C3, N3, A3, P3),

    % Primera condición: C2 comparte exactamente una característica con C1
    comparte_exactamente_una(N1, A1, P1, N2, A2, P2),

    % Segunda condición: C3 comparte exactamente una característica con C2
    comparte_exactamente_una(N2, A2, P2, N3, A3, P3).

% Auxiliar: verifica que dos cartas compartan exactamente una característica
comparte_exactamente_una(N1, A1, P1, N2, A2, P2) :-
    (
        (N1 = N2, A1 \= A2, P1 \= P2);
        (A1 = A2, N1 \= N2, P1 \= P2);
        (P1 = P2, N1 \= N2, A1 \= A2)
    ).



% mundoChiquito :- ...
mundoChiquito :-
    ternaMundoChiquito(C1, C2, C3),
    write(C1), write(' '),
    write(C2), write(' '),
    write(C3), nl,
    fail.               % fuerza backtracking para imprimir todas las soluciones
mundoChiquito.          % mundoChiquito. % termina cuando o hay mas soluciones

% agregarMostro :- ...

agregarMostro :-
    write('Ingrese el nombre del mostro (ej: dragonRojo).'), nl,
    read(Nombre),
    (mostro(Nombre, _, _, _) ->
        write('Error: ya existe un mostro con ese nombre.'), nl, fail
    ;
        true
    ),

    write('Ingrese el nivel (entero entre 1 y 12).'), nl,
    read(Nivel),
    (integer(Nivel), Nivel >= 1, Nivel =< 12 ->
        true
    ;
        write('Error: el nivel debe ser un entero entre 1 y 12.'), nl, fail
    ),

    write('Ingrese el atributo (agua, fuego, viento, tierra, luz, oscuridad, divino).'), nl,
    read(Atributo),
    (member(Atributo, [agua, fuego, viento, tierra, luz, oscuridad, divino]) ->
        true
    ;
        write('Error: atributo inválido.'), nl, fail
    ),

    write('Ingrese el poder (entero múltiplo de 50).'), nl,
    read(Poder),
    (integer(Poder), Poder > 0, 0 is Poder mod 50 ->
        true
    ;
        write('Error: el poder debe ser un entero positivo múltiplo de 50.'), nl, fail
    ),

    % Si todos los chequeos pasan, se inserta el hecho
    assertz(mostro(Nombre, Nivel, Atributo, Poder)),
    write('Carta agregada exitosamente!'), nl.
