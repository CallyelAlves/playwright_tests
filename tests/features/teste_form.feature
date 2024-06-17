Feature: Teste form


  Scenario: Preencher e enviar o formulário com todos os campos válidos
    Given que eu estou na página de formulário
    When eu preencho o campo Name com "Zé"
    And eu seleciono Coffee como bebida favorita
    And eu seleciono Blue como cor favorita
    And eu seleciono "Yes" no campo Você tem algum irmão?
    And eu preencho o campo email com "zedelas@example.com"
    And eu preencho o campo Message com Essa é uma mensagem de teste.
    And eu clico em Submit
    Then eu devo ver a mensagem Form submitted successfully!

  Scenario: Submeter formulário sem preencher campo obrigatório "Name"
    Given eu estou na página de formulário
    When eu deixo o campo "Name" vazio
    And eu seleciono "Milk" como bebida favorita
    And eu seleciono "Red" como cor favorita
    And eu seleciono "No" no campo "Você tem algum irmão?"
    And eu preencho o campo "Email" com "zedelas@example.com"
    And eu preencho o campo "Message" com "Essa é uma mensagem de teste."
    And eu clico em "Submit"
    Then eu devo ver a mensagem "Please fill out this field."

  Scenario: Selecionar múltiplas bebidas favoritas
    Given eu estou na página de formulário
    When eu preencho o campo "Name" com "Maria"
    And eu seleciono "Water" e "Wine" como bebidas favoritas
    And eu seleciono "Green" como cor favorita
    And eu seleciono "Maybe" no campo "Você tem algum irmão?"
    And eu preencho o campo "Email" com "maria@example.com"
    And eu preencho o campo "Message" com "Essa é uma mensagem de teste."
    And eu clico em "Submit"
    Then eu devo ver a mensagem "Form submitted successfully!"

  Scenario: Submeter formulário com email inválido
    Given o usuário está na página do formulário
    When o usuário preencher o campo "Name" com "Invalid Email Tester"
    And o usuário selecionar a bebida favorita "Milk"
    And o usuário selecionar a cor favorita "Blue"
    And o usuário selecionar a opção "No" para ter irmãos
    And o usuário preencher o campo "Email" com "invalid-email"
    And o usuário preencher o campo "Message" com "Testing invalid email format."
    And o usuário clicar no botão "Submit"
    Then o sistema deve exibir um alerta com a mensagem "Message received!"

  Scenario: Verificar preenchimento automático de siblings
    Given eu estou na página de formulário
    When eu preencho o campo "Name" com "Carol"
    And eu seleciono "No" no campo "Você tem algum irmão?"
    Then o campo "siblings" deve ter o valor "no"

  Scenario: Submeter formulário sem selecionar bebida favorita
    Given eu estou na página de formulário
    When eu preencho o campo "Name" com "Marcos"
    And eu deixo a bebida favorita não selecionada
    And eu seleciono "Pink" como cor favorita
    And eu seleciono "Yes" no campo "Você tem algum irmão?"
    And eu preencho o campo "Email" com "marquin@example.com"
    And eu preencho o campo "Message" com "Mensagem sem bebida favorita."
    And eu clico em "Submit"
    Then eu devo ver a mensagem "Message received!"

  Scenario: Submeter formulário sem selecionar cor favorita
    Given eu estou na página de formulário
    When eu preencho o campo "Name" com "Bia"
    And eu seleciono "Milk" como bebida favorita
    And eu deixo a cor favorita não selecionada
    And eu seleciono "Maybe" no campo "Você tem algum irmão?"
    And eu preencho o campo "Email" com "Bia@example.com"
    And eu preencho o campo "Message" com "Sem escolher a cor favorita."
    And eu clico em "Submit"
    Then eu devo ver a mensagem "Message received!"

  Scenario: Submeter formulário com mensagem longa
    Given eu estou na página de formulário
    When eu preencho o campo "Name" com "Ana"
    And eu seleciono "Coffee" como bebida favorita
    And eu seleciono "Blue" como cor favorita
    And eu seleciono "No" no campo "Você tem algum irmão?"
    And eu preencho o campo "Email" com "ana@example.com"
    And eu preencho o campo "Message" com "Essa é uma mensagem extensa. "
    And eu clico em "Submit"
    Then eu devo ver a mensagem "Message received!"

  Scenario: Submeter formulário com todos os campos não preenchidos
    Given eu estou na página de formulário
    When eu deixo todos os campos não preenchidos
    And eu clico em "Submit"
    Then eu devo ser direcionado para o campo "Name"

  Scenario: Submeter formulário com todos os campos preenchidos corretamente e múltiplas bebidas favoritas selecionadas
    Given o usuário está na página do formulário
    When o usuário preencher o campo "Name" com "Carlos"
    And o usuário selecionar as bebidas favoritas "Water" e "Coffee"
    And o usuário selecionar a cor favorita "Red"
    And o usuário selecionar a opção "Yes" para ter irmãos
    And o usuário preencher o campo "Email" com "carlos@example.com"
    And o usuário preencher o campo "Message" com "Mensagem teste com varias bebidas."
    And o usuário clicar no botão "Submit"
    Then o sistema deve exibir um alerta com a mensagem "Message received!"
