Funcionalidade: Experiência com usuários especiais e desempenho
  Como QA do Swag Labs
  Quero validar comportamentos específicos de contas especiais
  Para identificar problemas de UI, links e performance

  @TC21
  Cenário: Conta problem_user / verificação de links e imagens
    Dado que o site do Swag Labs esteja acessível
    Quando autenticar com o usuário "problem_user" e a senha "secret_sauce"
    E navegar pela lista de produtos
    E acessar páginas de detalhes de produtos
    Então quaisquer imagens quebradas ou links incorretos devem ser identificados
    E as inconsistências encontradas devem ser registradas como bugs

  @TC22
  Cenário: Conta performance_glitch_user / avaliação de latência
    Dado que o site do Swag Labs esteja acessível
    Quando autenticar com o usuário "performance_glitch_user" e a senha "secret_sauce"
    E acessar a página de produtos
    E observar o tempo de carregamento da página
    E comparar com o tempo de carregamento ao acessar com o usuário "standard_user"
    Então a diferença de performance entre as contas deve ser percebida e registrada
    E quaisquer lentidões significativas devem ser apontadas como possíveis problemas de desempenho
