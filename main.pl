% Pacientes adicionados serão dinâmicos
:- dynamic diabetes/2.
% Prompt para remover o |: que costuma aparecer nos writes
:- prompt(_, '').
% Banco de dados
diabetes([maria, feminino, 37.0, nao, nao, passado, 30.5, 5.7, 100], nao). %OK
diabetes([gorete, feminino, 53.0, nao, nao, passado, 26.37, 4.5, 112], nao). %OK
diabetes([pedro, masculino, 54.0, nao, nao, nunca, 31.86, 6.6, 145],nao). %OK
diabetes([juliana, feminino, 37.0, nao, nao, passado, 21.25, 6.1, 200], nao). %OK
diabetes([catisvalda, feminino, 56.0, nao, nao, nunca, 30.95, 6.5, 145], nao). %OK
diabetes([ursulino, masculino, 79.0, nao, nao, passado, 31.19, 5.8, 155], nao). %OK
diabetes([jose, masculino, 67.0, nao, nao, sim, 27.32, 6.8, 220], sim). %OK
diabetes([marta, feminino, 74.0, nao, nao, sim, 29.51, 8.2, 240], sim). %OK
diabetes([jussara, feminino, 37.0, nao, nao, passado, 36.87, 8.8, 160], sim). %OK
diabetes([katia, feminino, 65.0, sim, sim, nunca, 33.55, 8.9, 202], sim). % OK
diabetes([marcelo, masculino, 55.0, nao, sim, passado, 30.42, 6.2, 300], sim). %OK
diabetes([ayla, feminino, 61.0, nao, nao, passado, 34.45, 6.5, 280], sim). %OK
diabetes([rafaela, feminino, 58.0, sim, nao, nunca, 38.31, 7.0, 200], sim). %OK
diabetes([cassia, feminino, 61.0, nao, nao, sim, 30.11, 6.2, 240], sim). %OK
diabetes([elisa, feminino, 26.0, nao, nao, passado, 27.32, 4.0, 200], nao). %OK
diabetes([alice, feminino, 74.0, nao, nao, passado, 28.12, 5.0, 100], nao). %OK
diabetes([jade, feminino, 45.0, sim, nao, nunca, 23.05, 4.8, 130], nao). %OK
diabetes([heloise, masculino, 56.0, nao, nao, nunca, 26.78, 4.8, 200], nao). %OK
diabetes([benicio, masculino, 20.0, nao, nao, passado, 23.04, 5.7, 160], nao). %OK
diabetes([paulo, masculino, 70.0, nao, nao, passado, 15.94, 5.8, 158], nao). %OK
diabetes([otavio, masculino, 30.0, nao, nao, passado, 15.8, 6.2, 90], nao). %OK
diabetes([isis, feminino, 80.0, nao, nao, nunca, 22.04, 9.0, 209], sim). %OK
diabetes([francivaldo, masculino, 63.0, nao, sim, passado, 27.32, 6.6, 300], sim). %OK
diabetes([juvelino, masculino, 58.0, nao, nao, passado, 32.38, 6.6, 159], sim). %OK
diabetes([maya, feminino, 43.0, sim, nao, nunca, 34.21, 9.0, 160], sim). %OK
diabetes([genetildes, masculino, 56.0, nao, nao, nunca, 37.59, 4.0, 159], nao). %OK
diabetes([waldisney, masculino, 60.0, nao, nao, passado, 25.4, 4.0, 200], nao). %OK
diabetes([reinaldo, masculino, 27.0, nao, nao, passado, 27.32, 3.5, 100], nao). %OK
diabetes([frederico, masculino, 54.0, nao, nao, passado, 30.41, 5.0, 158], nao). %OK
% Função principal e executável
main :-
    nl, nl,
    write('HOSPITAL SIRIO-PIAUIES'), nl,
    write('1 - Adicionar e diagnosticar'), nl,
    write('2 - Listar pacientes'), nl,
    write('3 - Calcular IMC'), nl,
    write('4 - Editar paciente'), nl,
    write('5 - Remover paciente'), nl,
    write('6 - Sair'), nl,
    write('Escolha uma opcao: '),
    read(Opcao),    
    escolher_opcao(Opcao).

% Conjunto de situações conforme a opção escolhida
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

escolher_opcao(1) :-
    write('Digite o nome: '),
    read(Nome),
    (
        diabetes([Nome, _, _, _, _, _, _, _, _], _), nl, write('Paciente ja existe, digite o nome junto com seus sobrenomes!'), nl, write('Se existir uma pessoa exatamente com o mesmo nome e sobrenome, digite o CPF junto ao primeiro nome'), nl, nl, escolher_opcao(1);
        true
    ),
    write('Digite o sexo: '),
    read(Sexo),
    write('Digite a idade (XX.X): '),
    read(Idade),
    write('Sabe se tem hipertensao (s/n)?: '),
    read(TemHipertensao),
    (
        TemHipertensao = 's' -> write('Hipertensao (sim/nao): '), read(Hipertensao);
        TemHipertensao = 'n' -> Hipertensao = '_'
    ),
    write('Sabe se tem problema cardiaco? (s/n): '),
    read(TemCardiaco),
    (
        TemCardiaco = 's' -> write('Cardiaco (sim/nao): '), read(Cardiaco);
        TemCardiaco = 'n' -> Cardiaco = '_'
    ),
    write('Fumante? (sim/passado/nunca): '),
    read(Fumante),
    write('Sabe o seu IMC (s/n)?: '),
    read(SabeImc),
    (
        SabeImc = 's' -> write('Digite o IMC: '), read(IMC);
        SabeImc = 'n' -> calcular_imc(IMC)
    ),
    write('Sabe a hemoglobina (s/n)? '),
    read(SabeHemoglobina),
    (
        SabeHemoglobina = 's' -> write('Hemoglobina (X.X): '), read(Hemoglobina);
        SabeHemoglobina = 'n' -> Hemoglobina = '_'
    ),
    write('Sabe a glicose (s/n)? '),
    read(SabeGlicose),
    (
        SabeGlicose = 's' -> write('Glicose: '), read(Glicose);
        SabeGlicose = 'n' -> Glicose = '_'
    ),
    chances_diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes), nl,
    (
        Diabetes = 'sim' -> write('Voce possui Diabetes.'), nl;
        Diabetes = 'nao' -> write('Voce nao possui Diabetes'), nl;
        Diabetes = 'indeterminavel' -> write('Nao foi possivel realizar o diagnostico, volte com mais exames!'), nl  
    ),
    main.

escolher_opcao(6) :-
    write('Ate logo!'), nl.

% Função que adiciona o paciente ao banco de dados dinâmicos
adicionar_paciente([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes) :-
    \+ diabetes(Nome, _),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    write('Paciente diagnosticado!'), nl.

adicionar_paciente([Nome, _, _, _, _, _, _, _, _], _) :-
    diabetes(Nome, _),
    write('Paciente ja existe!'), nl.

% Função para calcular IMC caso o usuário não saiba
calcular_imc(Imc) :-
    write('Digite o peso: '),
    read(Peso),
    write('Digite a altura (em metros): '),
    read(Altura),
    TempImc is Peso / (Altura * Altura),
    Imc is round(TempImc * 100) / 100.

% Lista todos os pacientes do banco de dados junto com os novos pacientes dinâmicos
listar_pacientes :-
    diabetes(Paciente, Diabetes),
    write(Paciente),
    write(' - Diabetes: '), write(Diabetes),
    nl,
    fail.
listar_pacientes.

% Função para editar um paciente de acordo com a característica que o usuário deseja
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

% Conjunto de situações e edição, incluindo o novo cálculo da diabetes se necessário
editar_nome(Nome, NovoNome) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([NovoNome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    write('Nome editado com sucesso!'), nl.
% Bem como caso o paciente não exista, verificando-se em todos os casos
editar_nome(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_sexo(Nome, NovoSexo) :-
    retract(diabetes([Nome, _, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, NovoSexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    chances_diabetes([Nome, NovoSexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], NovaDiabetes),
    retract(diabetes([Nome, NovoSexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], _)),
    assertz(diabetes([Nome, NovoSexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], NovaDiabetes)),
    retract(diabetes([Nome, NovoSexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], _)),
    write('Sexo editado com sucesso!'), nl.
editar_sexo(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_idade(Nome, NovaIdade) :-
    retract(diabetes([Nome, Sexo, _, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, NovaIdade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    chances_diabetes([Nome, Sexo, NovaIdade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], NovaDiabetes),
    retract(diabetes([Nome, Sexo, NovaIdade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], _)),
    assertz(diabetes([Nome, Sexo, NovaIdade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], NovaDiabetes)),
    retract(diabetes([Nome, Sexo, NovaIdade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], _)),
    write('Idade editada com sucesso!'), nl.
editar_idade(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_hipertensao(Nome, NovaHipertensao) :-
    retract(diabetes([Nome, Sexo, Idade, _, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, NovaHipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    chances_diabetes([Nome, Sexo, Idade, NovaHipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], NovaDiabetes),
    retract(diabetes([Nome, Sexo, Idade, NovaHipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], _)),
    assertz(diabetes([Nome, Sexo, Idade, NovaHipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], NovaDiabetes)),
    retract(diabetes([Nome, Sexo, Idade, NovaHipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], _)),
    write('Hipertensao editada com sucesso!'), nl.
editar_hipertensao(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_cardiaco(Nome, NovaCardiaco) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, _, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, NovaCardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)),
    chances_diabetes([Nome, Sexo, Idade, Hipertensao, NovaCardiaco, Fumante, IMC, Hemoglobina, Glicose], NovaDiabetes),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, NovaCardiaco, Fumante, IMC, Hemoglobina, Glicose], _)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, NovaCardiaco, Fumante, IMC, Hemoglobina, Glicose], NovaDiabetes)),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, NovaCardiaco, Fumante, IMC, Hemoglobina, Glicose], _)),
    write('Problema cardiaco editado com sucesso!'), nl.
editar_cardiaco(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_fumante(Nome, NovoFumante) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, _, IMC, Hemoglobina, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, NovoFumante, IMC, Hemoglobina, Glicose], Diabetes)),
    chances_diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, NovoFumante, IMC, Hemoglobina, Glicose], NovaDiabetes),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, NovoFumante, IMC, Hemoglobina, Glicose], _)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, NovoFumante, IMC, Hemoglobina, Glicose], NovaDiabetes)),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, NovoFumante, IMC, Hemoglobina, Glicose], _)),
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
    chances_diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, NovoImc, Hemoglobina, Glicose], NovaDiabetes),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, NovoImc, Hemoglobina, Glicose], _)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, NovoImc, Hemoglobina, Glicose], NovaDiabetes)),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, NovoImc, Hemoglobina, Glicose], _)),
    write('IMC editado com sucesso!'), nl.
editar_imc(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_hemoglobina(Nome, NovaHemoglobina) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, _, Glicose], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, NovaHemoglobina, Glicose], Diabetes)),
    chances_diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, NovaHemoglobina, Glicose], NovaDiabetes),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, NovaHemoglobina, Glicose], _)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, NovaHemoglobina, Glicose], NovaDiabetes)),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, NovaHemoglobina, Glicose], _)),
    write('Hemoglobina editada com sucesso!'), nl.
editar_hemoglobina(_, _) :-
    write('Paciente nao encontrado!'), nl.

editar_glicose(Nome, NovaGlicose) :-
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, _], Diabetes)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, NovaGlicose], Diabetes)),
    chances_diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, NovaGlicose], NovaDiabetes),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, NovaGlicose], _)),
    assertz(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, NovaGlicose], NovaDiabetes)),
    retract(diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, NovaGlicose], _)),
    write('Glicose editada com sucesso!'), nl.
editar_glicose(_, _) :-
    write('Paciente nao encontrado!'), nl.

% Regra para contar o número de elementos em uma lista, excluindo os elementos '_'
contar_elementos_lista([], 0). % Caso base: a lista está vazia, então o número de elementos é 0
contar_elementos_lista([Elemento|Resto], Contagem) :-
    Elemento \= '_', %Verifica se o elemento atual não é igual a '_'
    contar_elementos_lista(Resto, ContagemRestante),
    Contagem is ContagemRestante + 1.

contar_elementos_lista(['_'|Resto], Contagem) :-
    contar_elementos_lista(Resto, Contagem). %Continuamos a contagem sem adicionar 1


% Regra para calcular a probabilidade de uma pessoa ter diabetes
chances_diabetes([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes) :-
    contar_elementos_lista([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], ContagemE),
    (   (ContagemE =< 1 ; Glicose = '_'; Hemoglobina = '_'; IMC = '_'),
        Diabetes = indeterminavel
    ;
        (ContagemE >= 6, ContagemE < 9), nl, % Caso em que o paciente não informou todas as informações
        write('AVISOS!:'), nl,
        write('E recomendado que tenha no minimo todas as caracteristicas preenchidas para um melhor diagnostico!'),nl,
        write('Como nao foi informado todas as informacoes que foram pedidas e possivel que exista uma margem de erro no diagnostico!'), nl, 
        write('Tambem nao sera adicionado na base de dados para nao acontecer conflitos em futuros diagnosticos!'),nl,nl,
        write('Perguntas Extras!'),nl,
        fator_sexo(Sexo, FatorSexo),
        fator_hipertensao(Hipertensao, FatorHipertensao),
        fator_idade(Idade, FatorIdade),
        fator_imc(IMC, FatorIMC),
        fator_hemoglobina(Hemoglobina, FatorHemoglobina),
        fator_glicose(Glicose, FatorGlicose),
        fator_cardiaco(Cardiaco, FatorCardiaco),
        fator_fumante(Fumante, FatorFumante),
        perguntas_extras(FatorHistoricoF, FatorSedentario), 

        Probabilidade is FatorIdade + FatorIMC + FatorHemoglobina + FatorCardiaco + FatorFumante + FatorHipertensao + FatorSexo + FatorSedentario,

        (   Probabilidade >= 7,
            (   FatorGlicose == 0,
                Probabilidade_H_I is FatorHemoglobina + FatorIMC + FatorHistoricoF,
                write(Probabilidade_H_I), nl,
                (   Probabilidade_H_I > 4, Diabetes = sim
                ;   Probabilidade_H_I < 2, Diabetes = nao
                ;   Probabilidade_H_I >= 3, Probabilidade_H_I =< 4, Diabetes = indeterminavel
                )
            ;   FatorGlicose == 1,
                Probabilidade_H_I is FatorHemoglobina + FatorIMC + FatorHistoricoF,
                write(Probabilidade_H_I), nl,
                (   Probabilidade_H_I > 4, Diabetes = sim
                ;   Probabilidade_H_I < 2, Diabetes = nao
                ;   Probabilidade_H_I >= 3, Probabilidade_H_I =< 4, Diabetes = indeterminavel
                )
            ;   FatorGlicose == 2,
                Diabetes = sim
            )
        ;   Probabilidade >= 4, Probabilidade < 7,
            (   FatorGlicose == 0,
                Diabetes = nao
            ;   FatorGlicose == 1,
                Probabilidade_H_I is FatorHemoglobina + FatorIMC + FatorHistoricoF,
                write(Probabilidade_H_I), nl,
                (   Probabilidade_H_I > 4, Diabetes = sim
                ;   Probabilidade_H_I < 2, Diabetes = nao
                ;   Probabilidade_H_I >= 3, Probabilidade_H_I =< 4, Diabetes = indeterminavel
                )
            ;   FatorGlicose == 2,
                Diabetes = sim
            )
        ;   Probabilidade < 4,
            (   FatorGlicose == 0,
                Diabetes = nao
            ;   FatorGlicose == 1,
                Probabilidade_H_I is FatorHemoglobina + FatorIMC + FatorHistoricoF,
                write(Probabilidade_H_I), nl,
                (   Probabilidade_H_I > 4, Diabetes = sim
                ;   Probabilidade_H_I < 2, Diabetes = nao
                ;   Probabilidade_H_I >= 3, Probabilidade_H_I =< 4, Diabetes = indeterminavel
                )
            ;   FatorGlicose == 2,
                Probabilidade_H_I is FatorHemoglobina + FatorIMC + FatorHistoricoF,
                write(Probabilidade_H_I), nl,
                (   Probabilidade_H_I > 4, Diabetes = sim
                ;   Probabilidade_H_I < 2, Diabetes = nao
                ;   Probabilidade_H_I >= 3, Probabilidade_H_I =< 4, Diabetes = indeterminavel
                )
            )
        )
    ;    % Fatores que contribuem para a probabilidade
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
                Probabilidade_H_I is FatorHemoglobina + FatorIMC,
                (   Probabilidade_H_I > 3, Diabetes = sim
                ;   Probabilidade_H_I =< 2, Diabetes = nao
                )
            ;   FatorGlicose == 1,
                Probabilidade_H_I is FatorHemoglobina + FatorIMC,
                (   Probabilidade_H_I > 3, Diabetes = sim
                ;   Probabilidade_H_I =< 2, Diabetes = nao
                )
            ;   FatorGlicose == 2,
                Diabetes = sim
            )
        ;   Probabilidade >= 4, Probabilidade < 7,
            (   FatorGlicose == 0,
                Diabetes = nao
            ;   FatorGlicose == 1,
                Probabilidade_H_I is FatorHemoglobina + FatorIMC,
                (   Probabilidade_H_I > 3, Diabetes = sim
                ;   Probabilidade_H_I =< 2, Diabetes = nao
                )
            ;   FatorGlicose == 2,
                Diabetes = sim
            )
        ;   Probabilidade < 4,
            (   FatorGlicose == 0,
                Diabetes = nao
            ;   FatorGlicose == 1,
                Probabilidade_H_I is FatorHemoglobina + FatorIMC,
                (   Probabilidade_H_I > 3, Diabetes = sim
                ;   Probabilidade_H_I =< 2, Diabetes = nao
                )
            ;   FatorGlicose == 2,
                Probabilidade_H_I is FatorHemoglobina + FatorIMC,
                (   Probabilidade_H_I > 3, Diabetes = sim
                ;   Probabilidade_H_I =< 2, Diabetes = nao
                )
            )
        ),
        adicionar_paciente([Nome, Sexo, Idade, Hipertensao, Cardiaco, Fumante, IMC, Hemoglobina, Glicose], Diabetes)
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

%Reúne os fatores que contribuem para a probabilidade de diabetes
fator_glicose(Glicose, Fator) :-
    maior_glicose_diabetes(MaiorGlicose), 
    menor_glicose_diabetes(MenorGlicose), 
    maior_glicose(MaiorGlicoseS), 
    menor_glicose(MenorGlicoseS),
    (
        (Glicose >= MenorGlicose, Glicose =< MaiorGlicoseS, Fator is 1);
        (Glicose =< MaiorGlicoseS, Glicose >= MenorGlicoseS, Fator is 0);
        (Glicose >= MenorGlicose, Glicose =< MaiorGlicose, Fator is 2);
        (Glicose < MenorGlicoseS, Fator is 0);
        (Glicose > MaiorGlicose, Fator is 2);
        (Glicose > MaiorGlicoseS, Glicose < MenorGlicose, Fator is 1);
        (Glicose = '_', Fator is 0)
    ).

%Caso o diagnóstico seja impreciso, o paciente é questionado sobre mais informações
perguntas_extras(FatorHF, FatorS) :-
        write('Voce e sedentario?'), nl,
        write('(sim ou nao): '), read(Sedentario),
        write('Voce tem um parente de primeiro grau - pai, mae, irmao ou irma - com diabetes? '), nl,
        write('(sim ou nao): '), read(HistoricoF), 
        (
            (Sedentario = 'sim', FatorS is 1);
            (Sedentario = 'nao', FatorS is 0)
        ),
        (
            (HistoricoF = 'sim', FatorHF is 2);
            (HistoricoF = 'nao', FatorHF is 0)    
        ).

% Regra para contar o número de pessoas masculinas com diabetes
contar_diabeticos_masculinos(Contagem) :-
    findall(_, (diabetes([_, masculino, _, _, _, _, _, _, _], sim)), Lista),
    length(Lista, Contagem).

% Regra para contar o número de pessoas femininas com diabetes
contar_diabeticos_femininos(Contagem) :-
    findall(_, (diabetes([_, feminino, _, _, _, _, _, _, _], sim)), Lista),
    length(Lista, Contagem).

% Fatores que contribuem para a probabilidade de diabetes
fator_sexo(Sexo, Fator) :-
    contar_diabeticos_masculinos(ContMasc),
    contar_diabeticos_femininos(ContFemi),
    (
        (ContMasc > ContFemi, Sexo = masculino, Fator is 1);
        (ContMasc > ContFemi, Sexo = feminino, Fator is 0);
        (ContFemi > ContMasc, Sexo = masculino, Fator is 0);
        (ContFemi > ContMasc, Sexo = feminino, Fator is 1);
        (Sexo = '_', Fator is 0)
    ).

% Fatores que contribuem para a probabilidade de diabetes
fator_hipertensao(Hipertensao, Fator) :-
    (
        (Hipertensao = 'sim', Fator is 2);
        (Hipertensao = 'nao', Fator is 0);
        (Hipertensao = '_', Fator is 0)
    ).
    
% Fatores individuais
fator_idade(Idade, Fator) :- 
    (
        (Idade >= 45, Fator is 2, !);
        (Idade < 45, Fator is 0);
        (Idade = '_', Fator is 0)
    ).

% Predicado para calcular a média do IMC para pacientes com diabetes
media_imc_diabetes(Media) :-
    findall(IMC, (diabetes([_, _, _, _, _, _, IMC, _, _], sim)), ListaIMCs),
    length(ListaIMCs, N),
    sumlist(ListaIMCs, Soma),
    Media is Soma / N.
    
    % Predicado para calcular a média do IMC para pacientes sem diabetes
media_imc_sem_diabetes(Media) :-
    findall(IMC, (diabetes([_, _, _, _, _, _, IMC, _, _], nao)), ListaIMCs),
    length(ListaIMCs, N),
    sumlist(ListaIMCs, Soma),
    Media is Soma / N.

% Fatores que contribuem para a probabilidade de diabetes
fator_imc(IMC, Fator) :- 
    media_imc_diabetes(MediaIMC),
    media_imc_sem_diabetes(MediaIMCS),
    (
        (IMC >= MediaIMC, Fator = 3, !);
        (IMC =< MediaIMC, IMC >= MediaIMCS, Fator = 1, !);
        (IMC =< MediaIMCS, Fator = 0);
        (IMC = '_', Fator is 0)
    ).

% Conjunto de regras para analisar os parâmetros de hemoglobina
menor_hemoglobina_diabetes(MenorHemoglobina) :-
    findall(Hemoglobina, diabetes([_, _, _, _, _, _, _, Hemoglobina, _], sim), ListaHemoglobinas),
    min_list(ListaHemoglobinas, MenorHemoglobina).
    
maior_hemoglobina_diabetes(MaiorHemoglobina) :-
    findall(Hemoglobina, diabetes([_, _, _, _, _, _, _, Hemoglobina, _], sim), ListaHemoglobinas),
    max_list(ListaHemoglobinas, MaiorHemoglobina).
    
menor_hemoglobina(MenorHemoglobinaS) :-
    findall(Hemoglobina, diabetes([_, _, _, _, _, _, _, Hemoglobina, _], nao), ListaHemoglobinas),
    min_list(ListaHemoglobinas, MenorHemoglobinaS).
    
maior_hemoglobina(MaiorHemoglobinaS) :-
    findall(Hemoglobina, diabetes([_, _, _, _, _, _, _, Hemoglobina, _], nao), ListaHemoglobinas),
    max_list(ListaHemoglobinas, MaiorHemoglobinaS).
    
fator_hemoglobina(Hemoglobina, Fator) :-
    menor_hemoglobina_diabetes(MenorHemoglobina),
    maior_hemoglobina_diabetes(MaiorHemoglobina),
    maior_hemoglobina(MaiorHemoglobinaS),
    menor_hemoglobina(MenorHemoglobinaS),
    (
        (Hemoglobina >= MenorHemoglobina, Hemoglobina =< MaiorHemoglobinaS, Fator = 1, !);
        (Hemoglobina =< MaiorHemoglobinaS, Hemoglobina >= MenorHemoglobinaS, Fator = 0, !);
        (Hemoglobina >= MenorHemoglobina, Hemoglobina =< MaiorHemoglobina, Fator = 2);
        (Hemoglobina < MenorHemoglobinaS, Fator = 0);
        (Hemoglobina > MaiorHemoglobina, Fator = 2);
        (Hemoglobina > MaiorHemoglobinaS, Hemoglobina < MenorHemoglobina, Fator = 1);
        (Hemoglobina = '_', Fator is 0)
    ).

% Fatores que contribuem para a probabilidade de diabetes
fator_cardiaco(Cardiaco, Fator) :- 
    (
        (Cardiaco = 'sim', Fator is 1);
        (Cardiaco = 'nao', Fator is 0);
        (Cardiaco = '_', Fator is 0) 
    ).

% Fatores que contribuem para a probabilidade de diabetes
fator_fumante(Fumante, Fator) :- 
    (
        (Fumante = 'sim', Fator is 2);
        (Fumante = 'passado', Fator is 1);
        (Fumante = 'nunca', Fator is 0);    
        (Fumante = '_', Fator is 0)
    ).