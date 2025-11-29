Funcionalidade: Ordenação de produtos na página de listagem
  Como usuário autenticado
  Quero ordenar os produtos por nome e preço
  Para comparar itens de forma mais eficiente

  Contexto:
    Dado que o usuário esteja autenticado no Swag Labs
    E esteja na página de listagem de produtos

  @TC05
  Cenário: Ordenação de produtos por Nome (A to Z)
    Quando selecionar a opção de ordenação "Name (A to Z)"
    Então os produtos devem ser exibidos em ordem alfabética ascendente pelo nome

  @TC06
  Cenário: Ordenação de produtos por Nome (Z to A)
    Quando selecionar a opção de ordenação "Name (Z to A)"
    Então os produtos devem ser exibidos em ordem alfabética descendente pelo nome

  @TC07
  Cenário: Ordenação de produtos por Preço (low to high)
    Quando selecionar a opção de ordenação "Price (low to high)"
    Então os produtos devem ser exibidos em ordem crescente de preço
    E produtos com menor valor devem aparecer antes dos de maior valor

  @TC08
  Cenário: Ordenação de produtos por Preço (high to low)
    Quando selecionar a opção de ordenação "Price (high to low)"
    Então os produtos devem ser exibidos em ordem decrescente de preço
    E produtos com maior valor devem aparecer antes dos de menor valor
