# Exemplo BDD

Utilizaremos uma ferramenta chamada Cucumber para realizar nossos testes orientados a comportamentos em código Python.

## Instalação
Para utilizar o Cucumber no Python precisamos instalar sua biblioteca chamada BEHAVE: https://cucumber.io/docs/installation/python/
  ```
  pip install behave
  ```

## Gherkin

É uma linguagem que descreve o comportamento do sistema de uma forma mais "humanizada" que pode ser entendida tanto pelo desenvolvedor como um PO ou Scrum Master, por exemplo.
Usamos palavras como: given, when, then para escrever o teste de comportamento esperado.

## Calculadora - Exemplo

### Passo 1 - Arquivo Feature
O arquivo de extensão ".feature" é o local que estará os cenários dos testes de comportamento que o behave consegue entender por meio da linguaguem Gherkin:
 ```
  Feature: Somar dois números
    Scenario: Realizar uma soma simples
    Given eu tenho dois números: 5 e 7
    When eu somo os dois números
    Then o resultado deve ser 12
```
Neste cenário temos:
a.	Given: Representa a configuração inicial do cenário. Nesse caso, estamos definindo que temos dois números, 5 e 7.
b.	When: Representa a ação que queremos realizar. Aqui, estamos executando a soma dos dois números.
c.	Then: Representa a verificação do resultado esperado. Queremos garantir que o resultado seja 12.

### Passo 2 - Implementação dos testes
Dentro da pasta "steps" criaremos um arquivo python de testes: test_calculadora_soma.py.
  ```
  from behave import given, when, then

  @given('eu tenho dois números: {num1:d} e {num2:d}')
  def step_impl(context, num1, num2):
    context.num1 = num1
    context.num2 = num2
  
  @when('eu somo os dois números')
    def step_impl(context):
    context.resultado = context.num1 + context.num2
  
  @then('o resultado deve ser {resultado:d}')
    def step_impl(context, resultado):
    assert context.resultado == resultado, f"Resultado incorreto. Esperado: {resultado}. Obtido: {context.resultado}"
  ```

### Passo 3 - Executando os testes
Agora precisamos executar os teste para avaliar se tudo esta ocorrendo como esperado, no CMD digite:
  ```
  behave
  ```

## Funcionamento
Dentro do escopo do projeto Python o Cucumber ao ser rodado em linha de comando ele passa por 3 fases:
1.	Ele busca pelas FEATURES dentro dos arquivos para definição dos cenários de testes.
2.	Busca pelos testes dentro da pasta “Steps”
3.	Por meio dos decorators (@ acima das funções) ao rodar o behave ele identifica quais se encaixam com o cenário previamente especificado no passo 1.
4.	Observações: É necessário UM arquivo para cada feature de teste e os steps/teste podem estar todos no mesmo arquivo porém uma boa prática é separar por funcionalidade/comportamento.


## OUTPUT 

anahelena in Aulas_Maua_2023/ECM231 - Engenharia de Software Remoto/TecnicasdeValidacao/bdd_example-master on  main [?] 
➜  behave
Feature: Somar dois números # features/somar.feature:4

  Scenario: Realizar uma soma simples           # features/somar.feature:5
    Given eu tenho dois números inteiros: 5 e 7 # steps/test_calculadora_soma.py:3 0.000s
    When eu somo os dois números inteiros       # steps/test_calculadora_soma.py:8 0.000s
    Then o resultado deve ser 12                # steps/test_calculadora_soma.py:12 0.000s
    Given eu tenho dois números inteiros: 3 e 4 # steps/test_calculadora_soma.py:3 0.000s
    When eu somo os dois números inteiros       # steps/test_calculadora_soma.py:8 0.000s
    Then o resultado deve ser 6                 # steps/test_calculadora_soma.py:12 0.000s
      Assertion Failed: Resultado incorreto. Esperado: 6. Obtido: 7


Feature: Subtrair dois números # features/subtrair.feature:1

  Scenario: Realizar uma subtração simples      # features/subtrair.feature:2
    Given eu tenho dois números inteiros: 5 e 7 # steps/test_calculadora_soma.py:3 0.000s
    When eu subtraio os dois números inteiros   # steps/test_subtrair.py:8 0.000s
    Then o resultado deve ser -2                # steps/test_calculadora_soma.py:12 0.000s


Failing scenarios:
  features/somar.feature:5  Realizar uma soma simples

1 feature passed, 1 failed, 0 skipped
1 scenario passed, 1 failed, 0 skipped
8 steps passed, 1 failed, 0 skipped, 0 undefined
Took 0m0.001s
anahelena in Aulas_Maua_2023/ECM231 - Engenharia de Software Remoto/TecnicasdeValidacao/bdd_example-master on  main [?] 
➜  