:- dynamic diabetes/2.
:- prompt(_, '').

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

main :-
    nl, nl,
    write('HOSPITAL SIRIO-PIAUIES'), nl,
    write('1 - Adicionar paciente'), nl,
    write('2 - Listar pacientes'), nl,
    write('3 - Calcular IMC'), nl,
    write('4 - Editar paciente'), nl,
    write('5 - Remover paciente'), nl,
    write('6 - Sair'), nl,
    write('Escolha uma opcao: '),
    read(Opcao),    
    escolher_opcao(Opcao).

escolher_opcao(1) :-
    write('Digite o nome: '),
    read(Nome),
    write('Digite o sexo: '),
    read(Sexo),
    write('Digite a idade: '),
    read(Idade),
    write('Hipertensao?: '),
    read(Hipertensao),
    write('Problema cardiaco?: '),
    read(Cardiaco),
    write('Fumante?: '),
    read(Fumante),
    write('Sabe o seu IMC (s/n)?: '),
    read(SabeImc),
    (
        SabeImc = 's' -> write('Digite o IMC: '), read(IMC);
        SabeImc = 'n' -> calcular_imc(IMC)
    ),
    write('Hemoglobina: '),
    read(Hemoglobina),
    write('Glicose: '),
    read(Glicose),
    chances_diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes),
    adicionar_paciente([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes),
    main.

escolher_opcao(2) :-
    listar_pacientes,
    main.

escolher_opcao(3) :-
    calcular_imc(Imc),
    write('IMC: '), write(Imc), nl,
    main.

escolher_opcao(4) :-
    editar_paciente,
    main.

escolher_opcao(5) :-
    write('Digite o nome do paciente que deseja remover: '),
    read(Nome),
    retract(diabetes([Nome, _, _, _, _, _, _, _, _], _)),
    write('Paciente removido com sucesso!'), nl,
    main.

escolher_opcao(6) :-
    write('Ate logo!'), nl.

adicionar_paciente([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes) :-
    \+ diabetes(Nome, _),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    write('Paciente adicionado com sucesso!'), nl.

adicionar_paciente([Nome, _, _, _, _, _, _, _, _], _) :-
    diabetes(Nome, _),
    write('Paciente ja existe!'), nl.

calcular_imc(Imc) :-
    write('Digite o peso: '),
    read(Peso),
    write('Digite a altura: '),
    read(Altura),
    TempImc is Peso / (Altura * Altura),
    Imc is round(TempImc * 10) / 10.

listar_pacientes :-
    diabetes(Paciente, Diabetes),
    write(Paciente), %aqui ele da um print no teu nome so e em diabetes ele mostra a lista com tudo
    write(' - Diabetes: '), write(Diabetes),
    nl,
    fail.
listar_pacientes.

editar_paciente :-
    write('Digite o nome do paciente que deseja editar: '),
    read(Nome),
    write('Digite qual campo deseja editar '), nl,
    write('(nome, sexo, idade, hipertensao, cardiaco, fumante, imc, hemoglobina, glicose, diabetes): '),
    read(Campo),
    (
        Campo = 'nome' -> write('Digite o novo nome: '), read(NovoNome), editar_nome(Nome, NovoNome);
        Campo = 'sexo' -> write('Digite o novo sexo: '), read(NovoSexo), editar_sexo(Nome, NovoSexo);
        Campo = 'idade' -> write('Digite a nova idade: '), read(NovaIdade), editar_idade(Nome, NovaIdade);
        Campo = 'hipertensao' -> write('Digite a nova situacao de hipertensao: '), read(NovaHipertensao), editar_hipertensao(Nome, NovaHipertensao);
        Campo = 'cardiaco' -> write('Digite a nova situacao cardiaca: '), read(NovaCardiaco), editar_cardiaco(Nome, NovaCardiaco);
        Campo = 'fumante' -> write('Digite a nova situacao de fumante: '), read(NovoFumante), editar_fumante(Nome, NovoFumante);
        Campo = 'imc' -> write('Digite o novo IMC: '), read(NovoImc), editar_imc(Nome, NovoImc);
        Campo = 'hemoglobina' -> write('Digite a nova hemoglobina: '), read(NovaHemoglobina), editar_hemoglobina(Nome, NovaHemoglobina);
        Campo = 'glicose' -> write('Digite a nova glicose: '), read(NovaGlicose), editar_glicose(Nome, NovaGlicose);
        Campo = 'diabetes' -> write('Digite a nova situacao de diabetes: '), read(NovoDiabetes), editar_diabetes(Nome, NovoDiabetes)
    ).

editar_nome(Nome, NovoNome) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([NovoNome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    write('Nome editado com sucesso!'), nl.
editar_nome(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_sexo(Nome, NovoSexo) :-
    retract(diabetes([Nome, _, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, NovoSexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    write('Sexo editado com sucesso!'), nl.
editar_sexo(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_idade(Nome, NovaIdade) :-
    retract(diabetes([Nome, Sexo, _, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, NovaIdade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    write('Idade editada com sucesso!'), nl.
editar_idade(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_hipertensao(Nome, NovaHipertensao) :-
    retract(diabetes([Nome, Sexo, Idade, _, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, NovaHipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    write('Hipertensao editada com sucesso!'), nl.
editar_hipertensao(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_cardiaco(Nome, NovaCardiaco) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, _, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, NovaCardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    write('Problema cardiaco editado com sucesso!'), nl.
editar_cardiaco(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_fumante(Nome, NovoFumante) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, _, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, NovoFumante, IMC, Hemoglobina, Glicose], Diabetes)),
    write('Fumante editado com sucesso!'), nl.
editar_fumante(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_imc(Nome, NovoImc) :-
    write('Deseja calcular o IMC? (s/n): '),
    read(Calcular),
    (
        Calcular = 's' -> calcular_imc(NovoImc);
        Calcular = 'n' -> true
    ),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, _, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, NovoImc, Hemoglobina, Glicose], Diabetes)),
    write('IMC editado com sucesso!'), nl.

editar_hemoglobina(Nome, NovaHemoglobina) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, _, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, NovaHemoglobina, Glicose], Diabetes)),
    write('Hemoglobina editada com sucesso!'), nl.

editar_glicose(Nome, NovaGlicose) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, _], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, NovaGlicose], Diabetes)),
    write('Glicose editada com sucesso!'), nl.

editar_diabetes(Nome, NovoDiabetes) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], _)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], NovoDiabetes)),
    write('Diabetes editada com sucesso!'), nl.
editar_diabetes(_, _) :-
    write('Paciente nao encontrado!'), nl.

% Regra para contar o número de elementos em uma lista, excluindo os elementos '_'
contar_elementos_lista([], 0). % Caso base: a lista está vazia, então o número de elementos é 0
contar_elementos_lista([Elemento|Resto], Contagem) :-
    Elemento \= '_', % Verifica se o elemento atual não é igual a '_'
    contar_elementos_lista(Resto, ContagemRestante),
    Contagem is ContagemRestante + 1.

contar_elementos_lista([_|Resto], Contagem) :- % Caso em que o elemento é '_', então não contamos
    contar_elementos_lista(Resto, Contagem). % Continuamos a contagem sem adicionar 1



% Regra para calcular a probabilidade de diabetes em escala de 0 a 1
chances_diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes) :-
    contar_elementos_lista([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], ContagemE),
    write(ContagemE), nl,
    (   (ContagemE =< 1 ; Glicose = '_'),
        Diabetes = indeterminavel
    ;   % Fatores que contribuem para a probabilidade
        fator_sexo(Sexo, FatorSexo),
        fator_hipertensao(Hipertensao, FatorHipertensao),
        fator_idade(Idade, FatorIdade),
        fator_imc(IMC, FatorIMC),
        fator_hemoglobina(Hemoglobina, FatorHemoglobina),
        fator_glicose(Glicose, FatorGlicose),
        fator_cardiaco(Cardiaco, FatorCardiaco),
        fator_fumante(Fumante, FatorFumante),

        % Cálculo da probabilidade
        Probabilidade is FatorIdade + FatorIMC + FatorHemoglobina + FatorCardiaco + FatorFumante + FatorHipertensao + FatorSexo,

        % Avaliação das condições de probabilidade
        (   Probabilidade >= 7,
            (   FatorGlicose == 0,
                perguntas_extras(Pextras),
                (   Pextras >= 2, Diabetes = sim
                ;   Pextras < 2, Diabetes = nao
                )
            ;   FatorGlicose == 1,
                perguntas_extras(Pextras),
                (   Pextras >= 2, Diabetes = sim
                ;   Pextras < 2, Diabetes = nao
                )
            ;   FatorGlicose == 2,
                Diabetes = sim
            )
        ;   Probabilidade >= 4, Probabilidade < 7,
            (   FatorGlicose == 0,
                Diabetes = nao
            ;   FatorGlicose == 1,
                perguntas_extras(Pextras),
                (   Pextras >= 2, Diabetes = sim
                ;   Pextras < 2, Diabetes = nao
                )
            ;   FatorGlicose == 2,
                Diabetes = sim
            )
        ;   Probabilidade < 4,
            (   FatorGlicose == 0,
                Diabetes = nao
            ;   FatorGlicose == 1,
                perguntas_extras(Pextras),
                (   Pextras >= 2, Diabetes = sim
                ;   Pextras < 2, Diabetes = nao
                )
            ;   FatorGlicose == 2,
                perguntas_extras(Pextras),
                (   Pextras >= 2, Diabetes = sim
                ;   Pextras < 2, Diabetes = nao
                )
            )
        )
    ).



% Regra para encontrar o menor valor de glicose quando o paciente tem diabetes
menor_glicose_diabetes(MenorGlicose) :-
    findall(Glicose, diabetes([_, _, _, _, _, _, _, _, Glicose], sim), ListaGlicoses),
    min_list(ListaGlicoses, MenorGlicose).

% Regra para encontrar o maior valor de glicose quando o paciente tem diabetes
maior_glicose_diabetes(MaiorGlicose) :-
    findall(Glicose, diabetes([_, _, _, _, _, _, _, _, Glicose], sim), ListaGlicoses),
    max_list(ListaGlicoses, MaiorGlicose).


% Regra para encontrar o menor valor de glicose quando o paciente não tem diabetes
menor_glicose(MenorGlicoseS) :-
    findall(Glicose, diabetes([_, _, _, _, _, _, _, _, Glicose], nao), ListaGlicoses),
    min_list(ListaGlicoses, MenorGlicoseS).

% Regra para encontrar o maior valor de glicose quando o paciente  não tem diabetes
maior_glicose(MaiorGlicoseS) :-
    findall(Glicose, diabetes([_, _, _, _, _, _, _, _, Glicose], nao), ListaGlicoses),
    max_list(ListaGlicoses, MaiorGlicoseS).


fator_glicose(Glicose, Fator) :-
    maior_glicose_diabetes(MaiorGlicose), 
    menor_glicose_diabetes(MenorGlicose), 
    maior_glicose(MaiorGlicoseS), 
    menor_glicose(MenorGlicoseS),
    (
        (Glicose >= MenorGlicose, Glicose =< MaiorGlicoseS, Fator is 1);
        (Glicose =< MaiorGlicoseS, Glicose >= MenorGlicoseS, Fator is 0);
        (Glicose >= MenorGlicose, Glicose =< MaiorGlicose, Fator is 2)
    ).

perguntas_extras(Pextras) :-
        write('Voce e sedentario?'), nl,
        write('sim ou nao: '), read(Sedentario),
        write('Voce tem um parente de primeiro grau - Pai, Mae, Irmao ou Irma - com diabetes? '), nl,
        write('sim ou nao: '), read(HistoricoF), 
        (
            (Sedentario = 'sim', FatorS is 1);
            (Sedentario = 'nao', FatorS is 0)
        ),
        (
            (HistoricoF = 'sim', FatorHF is 2);
            (HistoricoF = 'nao', FatorHF is 0)    
        ),
        Pextras is FatorS + FatorHF.



% Regra para contar o número de pessoas masculinas com diabetes
contar_diabeticos_masculinos(Contagem) :-
    findall(_, (diabetes([_, masculino, _, _, _, _, _, _, _], sim)), Lista),
    length(Lista, Contagem).

contar_diabeticos_femininos(Contagem) :-
    findall(_, (diabetes([_, feminino, _, _, _, _, _, _, _], sim)), Lista),
    length(Lista, Contagem).

% Exemplo de consulta
% ?- contar_diabeticos_masculinos(NumeroDeDiabeticosMasculinos).

fator_sexo(Sexo, Fator) :-
    contar_diabeticos_masculinos(ContMasc),
    contar_diabeticos_femininos(ContFemi),
    (
        (ContMasc > ContFemi, Sexo = masculino, Fator is 1);
        (ContMasc > ContFemi, Sexo = feminino, Fator is 0);
        (ContFemi > ContMasc, Sexo = masculino, Fator is 0);
        (ContFemi > ContMasc, Sexo = feminino, Fator is 1)
    ).

% contar_diabeticos_hipertensos(Contagem) :-
%     findall(_, (diabetes([_, _, _, sim, _, _, _, _, _], sim)), Lista),
%     length(Lista, Contagem).

% contar_diabeticos_nao_hipertensos(Contagem) :-
%     findall(_, (diabetes([_, _, _, nao, _, _, _, _, _], sim)), Lista),
%     length(Lista, Contagem).

fator_hipertensao(Hipertensao, Fator) :-
    (
        (Hipertensao = 'sim', Fator is 2);
        (Hipertensao = 'nao', Fator is 0)
    ).
    
% Fatores individuais
fator_idade(Idade, Fator) :- 
    (
        (Idade >= 45, Fator is 2, !);
        (Idade < 45, Fator is 0)    
    ).

fator_imc(IMC, Fator) :- 
    (
        (IMC =< 25, Fator is 0, !);
        (IMC > 25, IMC < 30, Fator is 1, !);
        (IMC >= 30, IMC < 35, Fator is 2, !);
        (IMC >= 35, Fator is 3)
    ).
fator_hemoglobina(Hemoglobina, Fator) :-
    (
        (Hemoglobina < 5.7, Fator is 0, !);
        (Hemoglobina >= 5.7, Hemoglobina < 6.5, Fator is 1, !);
        (Hemoglobina >= 6.5, Fator is 2)
    ).


fator_cardiaco(Cardiaco, Fator) :- 
    (
        (Cardiaco = 'sim', Fator is 1);
        (Cardiaco = 'nao', Fator is 0)    
    ).

fator_fumante(Fumante, Fator) :- 
    (
        (Fumante = 'sim', Fator is 2);
        (Fumante = 'passado', Fator is 1);
        (Fumante = 'nunca', Fator is 0)    
    ).

    
