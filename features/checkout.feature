Funcionalidade: Checkout de pedidos
  Como cliente autenticado com itens no carrinho
  Quero finalizar o checkout com segurança
  Para concluir minha compra de forma correta

  Contexto:
    Dado que o usuário esteja autenticado no Swag Labs
    E exista ao menos um item no carrinho

  @TC13
  Cenário: Validação de campos obrigatórios no checkout
    Quando acessar o carrinho
    E clicar no botão "Checkout"
    E clicar em "Continue" sem preencher nenhum campo
    Então deve visualizar mensagens de obrigatoriedade para os campos First Name, Last Name e Postal Code
    E deve permanecer na mesma etapa do checkout

  @TC14
  Cenário: Checkout com CEP inválido
    Quando iniciar o checkout a partir do carrinho
    E preencher o First Name com um valor válido
    E preencher o Last Name com um valor válido
    E informar um CEP inválido, como "00"
    E clicar em "Continue"
    Então deve visualizar uma mensagem de erro apropriada para o campo Postal Code
    E não deve avançar para a próxima etapa do checkout

  @TC15
  Cenário: Checkout completo (Happy Path)
    Quando iniciar o checkout a partir do carrinho
    E preencher corretamente First Name, Last Name e Postal Code
    E clicar em "Continue"
    E validar o resumo do pedido com itens e valores corretos
    E clicar no botão "Finish"
    Então deve visualizar a página de confirmação de pedido com a mensagem "THANK YOU FOR YOUR ORDER"
    E deve existir uma opção para voltar à loja

  @TC16
  Cenário: Página de confirmação / voltar para a página de produtos
    Dado que o checkout tenha sido concluído com sucesso
    E o usuário esteja na página de confirmação de pedido
    Quando clicar no botão "Back Home"
    Então deve ser redirecionado para a página de produtos
