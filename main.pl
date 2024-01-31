:- dynamic diabetes/2.

diabetes([maria, feminino, 37.0, nao, nao, passado, 30.5, 5.7, 100], nao).
diabetes([gorete, feminino, 53.0, nao, nao, passado, 26.37, 4.5, 112], nao).
diabetes([pedro, masculino, 54.0, nao, nao, nunca, 31.86, 6.6, 145],nao).
diabetes([juliana, feminino, 37.0, nao, nao, passado, 21.25, 6.1, 200], nao).
diabetes([catisvalda, feminino, 56.0, nao, nao, nunca, 30.95, 6.5, 145], nao).
diabetes([ursulino, masculino, 79.0, nao, nao, passado, 31.19, 5.8, 155], nao).
diabetes([jose, masculino, 67.0, nao, nao, sim, 27.32, 6.8, 220], sim).
diabetes([marta, feminino, 74.0, nao, nao, sim, 29.51, 8.2, 240], sim).
diabetes([jussara, feminino, 37.0, nao, nao, passado, 36.87, 8.8, 160], sim).
diabetes([katia, feminino, 65.0, sim, sim, nunca, 33.55, 8.9, 202], sim).
diabetes([marcelo, masculino, 55.0, nao, sim, passado, 30.42, 6.2, 300], sim).
diabetes([ayla, feminino, 61.0, nao, nao, passado, 34.45, 6.5, 280], sim).
diabetes([rafaela, feminino, 58.0, sim, nao, nunca, 38.31, 7.0, 200], sim).
diabetes([cassia, feminino, 61.0, nao, nao, sim, 30.11, 6.2, 240], sim).
diabetes([elisa, feminino, 26.0, nao, nao, passado, 27.32, 4.0, 200], nao).
diabetes([alice, feminino, 74.0, nao, nao, passado, 28.12, 5.0, 100], nao).
diabetes([jade, feminino, 45.0, sim, nao, nunca, 23.05, 4.8, 130], nao).
diabetes([heloise, masculino, 56.0, nao, nao, nunca, 26.78, 4.8, 200], nao).
diabetes([benicio, masculino, 20.0, nao, nao, passado, 23.04, 5.7, 160], nao).
diabetes([paulo, masculino, 70.0, nao, nao, passado, 15.94, 5.8, 158], nao).
diabetes([otavio, masculino, 30.0, nao, nao, passado, 15.8, 6.2, 90], nao).
diabetes([isis, feminino, 80.0, nao, nao, nunca, 25.04, 9.0, 209], sim).
diabetes([francinaldo, masculino, 63.0, nao, sim, passado, 27.32, 6.6, 300], sim).
diabetes([juvelino, masculino, 58.0, nao, nao, passado, 32.38, 6.6, 159], sim).
diabetes([maya, feminino, 43.0, sim, nao, nunca, 34.21, 9.0, 160], sim).
diabetes([genetildes, masculino, 56.0, nao, nao, nunca, 37.59, 4.0, 159], nao).
diabetes([waldisney, masculino, 60.0, nao, nao, passado, 25.4, 4.0, 200], nao).
diabetes([reinaldo, masculino, 27.0, nao, nao, passado, 27.32, 3.5, 100], nao).
diabetes([frederico, masculino, 54.0, nao, nao, passado, 30.41, 5.0, 158], nao).

adicionar_paciente([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes) :-
    \+ diabetes(Nome, _), % Check if the patient doesn't already exist
    assertz(diabetes(Nome, [Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose, Diabetes])),
    write('Paciente adicionado com sucesso!').

adicionar_paciente([Nome, _, _, _, _, _, _, _, _], Diabetes) :-
    diabetes(Nome, _),
    write('Paciente ja existe!'), nl.


calcular_imc(Imc) :-
    write('Digite o peso:'),
    read(Peso),
    write('Digite a altura: '),
    read(Altura),
    Imc is Peso / (Altura * Altura).

listar_pacientes :-
    diabetes(Paciente, Diabetes),
    write(Paciente),
    write(' - Diabetes: '), write(Diabetes),
    nl,
    fail.
listar_pacientes.

listar_pacientes_dinamicos :-
    paciente_dinamico(Nome, Atributos),
    write(Nome),
    write(' - Atributos: '), write(Atributos),
    nl,
    fail.
listar_pacientes_dinamicos.