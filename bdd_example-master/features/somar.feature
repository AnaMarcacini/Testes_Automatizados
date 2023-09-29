# BDD = Exemplificar com testes casos de uso (features) do sistema/classes e assim colaborar com um time utilizando uma linguagem humana. 
# Pode ser lido por Stakeholder/PO/Scrum Master 

Feature: Somar dois números
  Scenario: Realizar uma soma simples
    Given eu tenho dois números inteiros: 5 e 7
    When eu somo os dois números inteiros
    Then o resultado deve ser 12
  
    Given eu tenho dois números inteiros: 3 e 4
    When eu somo os dois números inteiros
    Then o resultado deve ser 6
