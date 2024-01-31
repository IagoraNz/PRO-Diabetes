listar_nomes_pacientes :-
    diabetes([Nome | _], _),
    write(Nome),
    nl,
    fail.
listar_nomes_pacientes.

listar_nomes_pacientes_dinamicos :-
    paciente_dinamico([Nome | _], _),
    write(Nome),
    nl,
    fail.
listar_nomes_pacientes_dinamicos.