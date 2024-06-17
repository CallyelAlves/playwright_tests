Feature: Teste de Formulário

Cenário: Preencher e enviar o formulário com todos os campos válidos
  Dado que eu estou na página de formulário
  Quando eu preencho o campo "Name" com "Zé"
  E eu seleciono "Coffee" como bebida favorita
  E eu seleciono "Blue" como cor favorita
  E eu seleciono "Yes" no campo "Você tem algum irmão?"
  E eu preencho o campo "Email" com "zedelas@example.com"
  E eu preencho o campo "Message" com "Essa é uma mensagem de teste."
  E eu clico em "Submit"
  Então eu devo ver a mensagem "Form submitted successfully!"

Cenário: Submeter formulário sem preencher campo obrigatório "Name"
  Dado que eu estou na página de formulário
  Quando eu deixo o campo "Name" vazio
  E eu seleciono "Milk" como bebida favorita
  E eu seleciono "Red" como cor favorita
  E eu seleciono "No" no campo "Você tem algum irmão?"
  E eu preencho o campo "Email" com "zedelas@example.com"
  E eu preencho o campo "Message" com "Essa é uma mensagem de teste."
  E eu clico em "Submit"
  Então eu devo ver a mensagem "Please fill out this field."

Cenário: Selecionar múltiplas bebidas favoritas
  Dado que eu estou na página de formulário
  Quando eu preencho o campo "Name" com "Maria"
  E eu seleciono "Water" e "Wine" como bebidas favoritas
  E eu seleciono "Green" como cor favorita
  E eu seleciono "Maybe" no campo "Você tem algum irmão?"
  E eu preencho o campo "Email" com "maria@example.com"
  E eu preencho o campo "Message" com "Essa é uma mensagem de teste."
  E eu clico em "Submit"
  Então eu devo ver a mensagem "Form submitted successfully!"

Cenário: Submeter formulário com email inválido
  Dado que o usuário está na página do formulário
  Quando o usuário preencher o campo "Name" com "Invalid Email Tester"
  E o usuário selecionar a bebida favorita "Milk"
  E o usuário selecionar a cor favorita "Blue"
  E o usuário selecionar a opção "No" para ter irmãos
  E o usuário preencher o campo "Email" com "invalid-email"
  E o usuário preencher o campo "Message" com "Testing invalid email format."
  E o usuário clicar no botão "Submit"
  Então o sistema deve exibir um alerta com a mensagem "Message received!"

Cenário: Verificar preenchimento automático de siblings
  Dado que eu estou na página de formulário
  Quando eu preencho o campo "Name" com "Carol"
  E eu seleciono "No" no campo "Você tem algum irmão?"
  Então o campo "siblings" deve ter o valor "no"

Cenário: Submeter formulário sem selecionar bebida favorita
  Dado que eu estou na página de formulário
  Quando eu preencho o campo "Name" com "Marcos"
  E eu deixo a bebida favorita não selecionada
  E eu seleciono "Pink" como cor favorita
  E eu seleciono "Yes" no campo "Você tem algum irmão?"
  E eu preencho o campo "Email" com "marquin@example.com"
  E eu preencho o campo "Message" com "Mensagem sem bebida favorita."
  E eu clico em "Submit"
  Então eu devo ver a mensagem "Message received!"

Cenário: Submeter formulário sem selecionar cor favorita
  Dado que eu estou na página de formulário
  Quando eu preencho o campo "Name" com "Bia"
  E eu seleciono "Milk" como bebida favorita
  E eu deixo a cor favorita não selecionada
  E eu seleciono "Maybe" no campo "Você tem algum irmão?"
  E eu preencho o campo "Email" com "Bia@example.com"
  E eu preencho o campo "Message" com "Sem escolher a cor favorita."
  E eu clico em "Submit"
  Então eu devo ver a mensagem "Message received!"

Cenário: Submeter formulário com mensagem longa
  Dado que eu estou na página de formulário
  Quando eu preencho o campo "Name" com "Ana"
  E eu seleciono "Coffee" como bebida favorita
  E eu seleciono "Blue" como cor favorita
  E eu seleciono "No" no campo "Você tem algum irmão?"
  E eu preencho o campo "Email" com "ana@example.com"
  E eu preencho o campo "Message" com "Essa é uma mensagem extensa. ".repeat(20)
  E eu clico em "Submit"
  Então eu devo ver a mensagem "Message received!"

Cenário: Submeter formulário com todos os campos não preenchidos
  Dado que eu estou na página de formulário
  Quando eu deixo todos os campos não preenchidos
  E eu clico em "Submit"
  Então eu devo ser direcionado para o campo "Name"

Cenário: Submeter formulário com todos os campos preenchidos corretamente e múltiplas bebidas favoritas selecionadas
  Dado que o usuário está na página do formulário
  Quando o usuário preencher o campo "Name" com "Carlos"
  E o usuário selecionar as bebidas favoritas "Water" e "Coffee"
  E o usuário selecionar a cor favorita "Red"
  E o usuário selecionar a opção "Yes" para ter irmãos
  E o usuário preencher o campo "Email" com "carlos@example.com"
  E o usuário preencher o campo "Message" com "Mensagem teste com varias bebidas."
  E o usuário clicar no botão "Submit"
  Então o sistema deve exibir um alerta com a mensagem "Message received!"
