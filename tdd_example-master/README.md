# Exemplo TDD

TDD é uma prática de desenvolvimento de software que é baseada em escrevermos testes antes mesmo do código em produção, desta maneira garantindo que o código produzido sempre estará testado.
A ideia desse exemplo é termos uma classe "Calculadora" em que devemos garantir que as 4 operações matemáticas funcionem de maneira correta.

## Passo 1 - Começando, obviamente, pelos testes

Criaremos em uma pasta "tests" um arquivo Python: test_calculadora.py. Nele definiremos todos os testes para as 4 operações matemáticas usando a classe "Calculadora":

class Test_Calculadora:
  ```
  def test_add(self):
    result = Calculator.add(2, 3)
    assert result == 5
    
  def test_add2(self):
    result = Calculator.add(2, -3)
    assert result == -1

  def test_subtracao(self):
    result = Calculator.subtracao(2, -3)
    assert result == 5

  def test_multiplicacao(self):
    result = Calculator.multi(2, 3)
    assert result == 6

  def test_divisao(self):
    result = Calculator.divisao(9, 3)
    assert result == 3
  ```
Estes testes não rodarão pois estão com erros, afinal não criamos a classe "Calculadora" ainda, porém é importante entender que todos as possíveis operações/funcionalidades dessa classe estão garatidamente testadas.

## Passo 2 - Criando a classe
  ```
  class Calculadora:
      
      @staticmethod
      def add(a, b):
          return a + b

      @staticmethod
      def subtracao(a, b):
          return a - b

      @staticmethod
      def multi(a, b):
          return a * b

      @staticmethod
      def divisao(a, b):
          return a / b
  ```
## Passo 3 - Executando os testes
Antes de executarmos, uma boa prática é criamos um ambiente virtual para executarmos nosso código Python, utilizaremos o módulo "venv" disponivel no próprio Python, ele replicará nosso ambiente em um ambiente a parte onde podemos instalar e testar dependencias sem usar nossa própria máquina.
  ```
  python -m venv venv
  ```
Ativar o ambiente:
  ```
  venv\Scripts\activate
  ```

Perceba que em seu cmd já estamos em um ambiente virtual (venv) e podemos instalar nossas dependências, no caso o pytest que executará nosso testes em Python:
  ```
  pip install pytest
  ```
Execute-o e garanta que todos os testes passaram:
  ```
  pytest
  ```

anahelena in Aulas_Maua_2023/ECM231 - Engenharia de Software Remoto/TecnicasdeValidacao/tdd_example-master on  main [?] 
➜  pytest                                      
=================================================== test session starts ====================================================
platform linux -- Python 3.9.13, pytest-7.1.2, pluggy-1.0.0
rootdir: /home/anahelena/GITs/Aulas_Maua_2023/ECM231 - Engenharia de Software Remoto/TecnicasdeValidacao/tdd_example-master
plugins: anyio-3.5.0, dash-2.11.0
collected 8 items                                                                                                          

tests/test_calculator.py .....F                                                                                      [ 75%]
tests/test_get_data.py ..                                                                                            [100%]

========================================================= FAILURES =========================================================
__________________________________________ Test_Calculator.test_divisao_por_zero ___________________________________________

self = <tests.test_calculator.Test_Calculator object at 0x7f46ab1552b0>

    def test_divisao_por_zero(self):
>       result = Calculator.divisao(9, 0)

tests/test_calculator.py:30: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

a = 9, b = 0

    @staticmethod
    def divisao(a, b):
>       return a / b
E       ZeroDivisionError: division by zero

src/calculator.py:17: ZeroDivisionError
================================================= short test summary info ==================================================
FAILED tests/test_calculator.py::Test_Calculator::test_divisao_por_zero - ZeroDivisionError: division by zero
=============================================== 1 failed, 7 passed in 3.27s ================================================
anahelena in Aulas_Maua_2023/ECM231 - Engenharia de Software Remoto/TecnicasdeValidacao/tdd_example-master on  main [?] took 4,8s 


