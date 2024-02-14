# :page_facing_up: Sistema de Diagnóstico de Diabetes em Prolog

**Programadores:** Iago Roberto, Francinaldo Barbosa e Cristina de Moura

## :link: Descrição do projeto

**Nota:** _/10

Sistemas de diagnóstico de diabetes proposto para a conclusão da disciplina de Programação Lógica noo curso de Bacharelado em Sistemas de Informação na Universidade Federal do Piauí - CSHNB em Picos,
ministrada pelo professor Alan Rafael. O diagnóstico é condicionado aos parâmetros extraídos do banco de dados fornecido, levando em consideração: sexo, idade, hipertensão, problemas cardíacos, fumante, IMC, hemoglobina
e glicemia (glicose) para realizar o diagnóstico. Tantos os parâmetros, como os novos pacientes são dinâmicos e alteram seus valores conforme cada execução.

## :link: Configurações e execução
 Certifique-se de ter a versão mais atualizada do SWI-Prolog

```
SWI-Prolog version 9.0.4 for x64-win64
```

O Visual Studio Code, durante o desenvolvimento desse sistema, se encontra na versão:

```
1.86.1
31c37ee8f63491495ac49e43b8544550fbae4533
x64
```

Caso seu SWI-Prolog não esteja atrelado ao Visual Studio Code, pode atrelá-lo dentro do Prolog nativo. Em ambos o caso, execute na consulta:

```
?- main.
```

O que executará e exibirá o menu contendo as possibilidades do sistema, bem como todos os mecanismo de diagnóstico em diabetes.

## :link: Funcionalidades
### :wrench: Opção 1 - Adicionar e diagnosticar

Nesta função, os dados do paciente são coletados e utilizados para realizar de maneira automática o diagnóstico da doença. Caso não se saiba uma das característica solicitadas, o Prolog retorna perguntas extras que possam ser facilmente respondidas.
Em caso de omissão da hemoglobina ou da glicose, o diagnóstico retorna inconclusivo.

Há também a presença de blindagens, como a impossibilidade de pacientes com nomes iguais (solicitando sobrenome e se necessário, até mesmo o CPF).

### :wrench: Opção 2 - Listar pacientes

Lista todos os pacientes do banco de dados e os novos pacientes, incluindo suas características e o diagnóstico

### :wrench: Opção 3 - Calcula IMC

Solicita peso e altura para calcular o IMC, essa função também se encontra incluida nas funcionalidades de adicionar e editar

### :wrench: Opção 4 - Editar paciente

Com base no nome do paciente e da característica que deseja modificar, as informações são editadas e, se necessário, um novo diagnóstico é feito de maneira automática

### :wrench: Opção 5 - Remover paciente

Remove o paciente do banco de dados dinâmico, durante aquela execução.

### :wrench: Opção 6 - Saída

Encerra a aplicação
