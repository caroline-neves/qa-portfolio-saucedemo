
# Casos de Teste – Sauce Demo

## Login

| ID   | Título                       | Pré-condição | Dados de Teste | Passos | Resultado Esperado |
|------|------------------------------|--------------|----------------|--------|--------------------|
| TC01 | Login com credenciais válidas | Site acessível | Usuário: `standard_user`<br>Senha: `secret_sauce` | 1. Acessar URL<br>2. Informar usuário válido<br>3. Informar senha válida<br>4. Clicar em "Login" | Redireciona para página de produtos; ícone do carrinho visível |
| TC02 | Login com senha inválida      | Site acessível | Usuário: `standard_user`<br>Senha: `123456` | 1. Acessar URL<br>2. Usuário válido<br>3. Senha inválida<br>4. Login | Exibe mensagem clara de erro; permanece na tela |
| TC03 | Login com usuário bloqueado   | Site acessível | Usuário: `locked_out_user`<br>Senha: `secret_sauce` | 1. Acessar URL<br>2. Usuário bloqueado<br>3. Senha válida<br>4. Login | Mensagem de bloqueio exibida |
| TC04 | Logout com sucesso            | Usuário autenticado | — | 1. Abrir menu<br>2. Clicar em "Logout" | Retorna à tela de login |

---

## Catálogo / Ordenação

| ID   | Título | Pré-condição | Passos | Resultado Esperado |
|------|--------|--------------|--------|--------------------|
| TC05 | Ordenação por Nome (A-Z) | Usuário autenticado | Selecionar "Name (A to Z)" | Lista ordenada alfabeticamente crescente |
| TC06 | Ordenação por Nome (Z-A) | Usuário autenticado | Selecionar "Name (Z to A)" | Lista ordenada alfabeticamente decrescente |
| TC07 | Ordenação por Preço (low-high) | Usuário autenticado | Selecionar "Price (low to high)" | Produtos ordenados do menor para maior preço |
| TC08 | Ordenação por Preço (high-low) | Usuário autenticado | Selecionar "Price (high to low)" | Produtos ordenados do maior para menor preço |

---

## Carrinho

| ID   | Título | Pré-condição | Passos | Resultado Esperado |
|------|--------|--------------|--------|--------------------|
| TC09 | Adicionar item pela lista | Usuário autenticado | Clicar em "Add to cart" na lista | Contador do carrinho = 1, botão vira "Remove" |
| TC10 | Adicionar item pelo detalhe | Usuário autenticado | 1. Abrir detalhes do produto<br>2. Clicar "Add to cart" | Item adicionado e marcado no retorno à lista |
| TC11 | Remover item da lista | Item no carrinho | Clicar em "Remove" | Item removido; contador decrementa |
| TC12 | Visualizar carrinho | Item no carrinho | Abrir ícone do carrinho | Lista de itens correta; valores exibidos |

---

## Checkout

| ID   | Título | Pré-condição | Dados de Teste | Passos | Resultado Esperado |
|------|--------|--------------|----------------|--------|--------------------|
| TC13 | Campos obrigatórios | Item no carrinho | — | Tentar prosseguir sem preencher campos | Mensagens de obrigatoriedade exibidas |
| TC14 | CEP inválido | Item no carrinho | Nome: Caroline<br>Sobrenome: Oliveira<br>CEP: 00 | Preencher dados válidos, CEP inválido, continuar | Mensagem de erro no campo Postal Code |
| TC15 | Checkout completo (Happy Path) | Item no carrinho | Nome: Caroline<br>Sobrenome: Oliveira<br>CEP: 40000-000 | Preencher dados válidos → Continue → Finish | Exibe confirmação “THANK YOU FOR YOUR ORDER” |
| TC16 | Voltar à Home após confirmação | Pedido finalizado | — | Clicar em "Back Home" | Retorna à lista de produtos |

---

## Outros Fluxos

| ID   | Título | Pré-condição | Passos | Resultado Esperado |
|------|--------|--------------|--------|--------------------|
| TC17 | Contador carrinho com múltiplos itens | Usuário autenticado | Adicionar 2–3 itens diferentes | Contador = quantidade correta; carrinho correto |
| TC18 | Persistência ao navegar | Item no carrinho | Navegar entre páginas (detalhes, About etc.) | Item continua no carrinho; contador mantido |
| TC19 | Acesso direto sem login | Não autenticado | Acessar URL interna de produtos | Redireciona para tela de login |
| TC20 | Mensagens de erro consistentes | Forçar erro (login/checkout) | Observar visual da mensagem | Texto claro, legível, alinhado |

---

## Contas Especiais

| ID   | Título | Dados de Teste | Passos | Resultado Esperado |
|------|--------|----------------|--------|--------------------|
| TC21 | Login com usuário bloqueado (`locked_out_user`) | Usuário: `locked_out_user`<br>Senha: `secret_sauce` | 1. Acessar o site<br>2. Digitar credenciais válidas<br>3. Clicar em Login | Exibir mensagem de bloqueio: *"Sorry, this user has been locked out."* sem permitir acesso ao catálogo |
| TC22 | Problemas visuais na UI com `problem_user` | Usuário: `problem_user`<br>Senha: `secret_sauce` | 1. Logar com `problem_user`<br>2. Navegar pelo catálogo e abrir páginas de detalhes<br>3. Adicionar/remover itens | Verificar se imagens estão corretas, botões funcionam, links não estão quebrados. Registrar falhas visuais encontradas |
| TC23 | Teste de performance com `performance_glitch_user` | Usuário: `performance_glitch_user`<br>Senha: `secret_sauce` | 1. Logar com `performance_glitch_user`<br>2. Medir tempo de carregamento da página de produtos<br>3. Comparar com `standard_user` | O carregamento deve ser perceptivelmente mais lento nesta conta. Registrar tempos e evidências |
| TC24 | Testes de comportamento com `error_user` | Usuário: `error_user`<br>Senha: `secret_sauce` | 1. Logar com `error_user`<br>2. Realizar navegação no catálogo<br>3. Tentar finalizar compra | Validar se o sistema retorna erros inesperados. Registrar mensagens ou falhas anormais |
| TC25 | Testes de layout com `visual_user` | Usuário: `visual_user`<br>Senha: `secret_sauce` | 1. Logar com `visual_user`<br>2. Verificar layout do catálogo e detalhes<br>3. Reduzir tamanho da janela (responsividade) | Elementos devem manter alinhamento, ícones devem estar visíveis e legíveis. Identificar falhas visuais de layout |

---
