Funcionalidade: Gerenciamento de carrinho de compras
  Como usuário autenticado
  Quero adicionar, remover e visualizar itens no carrinho
  Para controlar os produtos que pretendo comprar

  Contexto:
    Dado que o usuário esteja autenticado no Swag Labs
    E esteja na página de listagem de produtos

  @TC09
  Cenário: Adicionar item ao carrinho pela lista de produtos
    Quando clicar no botão "Add to cart" de um produto na lista
    Então o contador do carrinho deve ser incrementado para 1
    E o botão do produto deve ser alterado para "Remove"

  @TC10
  Cenário: Adicionar item ao carrinho pela página de detalhes
    Quando acessar a página de detalhes de um produto a partir da lista
    E clicar no botão "Add to cart" na página de detalhes
    E retornar para a lista de produtos
    Então o contador do carrinho deve ser incrementado
    E o produto deve aparecer marcado como adicionado (botão "Remove")

  @TC11
  Cenário: Remover item do carrinho pela lista de produtos
    Dado que exista ao menos um item adicionado ao carrinho pela lista
    Quando clicar no botão "Remove" do item na lista de produtos
    Então o contador do carrinho deve ser decrementado
    E o botão deve voltar a exibir "Add to cart"

  @TC12
  Cenário: Visualizar carrinho e itens adicionados
    Dado que exista ao menos um item no carrinho
    Quando clicar no ícone do carrinho no topo da página
    Então deve visualizar a lista de itens adicionados
    E os valores dos itens devem estar corretos
    E cada item deve permitir remoção individual

  @TC17
  Cenário: Contador do carrinho com múltiplos itens
    Quando adicionar dois ou mais produtos distintos ao carrinho
    Então o contador do carrinho deve refletir a quantidade total de itens adicionados
    E ao acessar o carrinho todos os itens adicionados devem estar listados corretamente

  @TC18
  Cenário: Persistência do carrinho ao navegar pelo sistema
    Dado que exista ao menos um item no carrinho
    Quando navegar entre a lista de produtos e a página de detalhes de um produto
    E acessar outra página pelo menu, como "About", e depois retornar à lista
    Então os itens devem permanecer no carrinho
    E o contador do carrinho deve manter o mesmo valor
