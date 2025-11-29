Funcionalidade: Autenticação e sessão no Swag Labs
  Como usuário do Swag Labs
  Quero acessar e sair do sistema com segurança
  Para visualizar os produtos apenas quando estiver autenticado

  @TC01
  Cenário: Login com credenciais válidas
    Dado que o site do Swag Labs esteja acessível em "https://www.saucedemo.com/"
    E que o usuário esteja na página de login
    Quando informar o usuário "standard_user"
    E informar a senha "secret_sauce"
    E clicar no botão "Login"
    Então deve ser redirecionado para a página de produtos
    E o ícone do carrinho deve estar visível
    E o menu lateral deve estar disponível

  @TC02
  Cenário: Login com senha inválida
    Dado que o site do Swag Labs esteja acessível
    E que o usuário esteja na página de login
    Quando informar o usuário "standard_user"
    E informar uma senha inválida
    E clicar no botão "Login"
    Então deve permanecer na página de login
    E deve visualizar uma mensagem de erro sobre credenciais inválidas

  @TC03
  Cenário: Login com usuário bloqueado
    Dado que o site do Swag Labs esteja acessível
    E que o usuário esteja na página de login
    Quando informar o usuário "locked_out_user"
    E informar a senha "secret_sauce"
    E clicar no botão "Login"
    Então deve permanecer na página de login
    E deve visualizar a mensagem de bloqueio "Sorry, this user has been locked out."

  @TC04
  Cenário: Logout com sucesso
    Dado que o usuário esteja autenticado com sucesso
    E esteja na página de produtos
    Quando abrir o menu lateral
    E clicar na opção "Logout"
    Então deve ser redirecionado para a página de login
    E a sessão do usuário deve ser finalizada

  @TC19
  Cenário: Acesso direto à página de produtos sem login
    Dado que o usuário não esteja autenticado em uma nova sessão
    Quando tentar acessar diretamente a URL interna da página de produtos
    Então deve ser redirecionado para a página de login
    E o acesso à lista de produtos deve ser impedido

  @TC20
  Cenário: Exibição de mensagens de erro com consistência visual
    Dado que o site do Swag Labs esteja acessível
    E que o usuário esteja na página de login
    Quando informar credenciais inválidas
    E clicar no botão "Login"
    Então deve visualizar uma mensagem de erro clara e legível
    E a mensagem deve estar alinhada visualmente com a interface
    E o ícone de erro, se exibido, deve estar corretamente posicionado ao lado da mensagem
