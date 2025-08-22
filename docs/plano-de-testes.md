# PLANO DE TESTES – SAUCE DEMO

> Projeto: Portfólio QA – Testes Manuais em [https://www.saucedemo.com/](https://www.saucedemo.com/)
> Autora: Caroline Oliveira
> Data: 22/08/2025
> Versão do documento: 1.0

---

## 1. Objetivo

Definir a estratégia, o escopo e o cronograma dos testes manuais no site Sauce Demo, cobrindo fluxos essenciais de e‑commerce (login, catálogo, carrinho e checkout), com foco em identificar defeitos funcionais, problemas de usabilidade básica e validações de dados.

## 2. Escopo

### 2.1. Itens de Teste (In Scope)

* Autenticação: login/logout.
* Catálogo de produtos: listagem, ordenação e detalhes do produto.
* Carrinho: adicionar/remover itens, contagem de itens.
* Checkout: informação do cliente, resumo de compra, finalização e confirmação.
* Responsividade básica (desktop e viewport reduzido simulada no navegador).
* Mensagens de erro/validações (campos obrigatórios, credenciais inválidas).

### 2.2. Fora do Escopo (Out of Scope)

* Integrações externas reais de pagamento (é um ambiente de demonstração).
* Performance aprofundada e testes de carga.
* Acessibilidade avançada (WCAG completa) – apenas apontamentos visuais simples.
* Testes mobile nativos (apenas simulação via DevTools).

## 3. Requisitos/Histórias (Base de Teste)

R1. Como usuário, quero fazer **login** para acessar o catálogo.
R2. Como usuário, quero **visualizar e ordenar** produtos.
R3. Como usuário, quero **adicionar e remover** produtos do carrinho.
R4. Como usuário, quero **finalizar a compra** informando meus dados e recebendo confirmação.
R5. Como usuário, quero **ver mensagens claras de erro** quando eu preencher dados inválidos ou deixar campos obrigatórios em branco.

> Observação: O Sauce Demo oferece contas de teste com comportamentos específicos (ver seção 7 – Dados de Teste).

## 4. Abordagem de Teste

* **Funcionais (caixa-preta):** testes positivos/negativos, partição de equivalência e valor limite em campos.
* **Exploratórios:** sessões curtas (30–45 min) por área crítica para descobrir defeitos não cobertos por scripts.
* **Regressão manual leve:** reexecutar casos críticos (smoke) a cada mudança perceptível de estado.
* **Cross‑browser básico:** Chrome (principal) e 1 navegador secundário (Firefox) quando possível.

## 5. Ambiente de Teste

* Ambiente: produção pública de demonstração (**SauceDemo**).
* Navegadores alvo: Chrome estável (última versão), Firefox estável.
* SO: Windows 10/11.
* Resoluções-alvo: 1366×768 e 1920×1080 (com checagem responsiva via DevTools).
* Ferramentas: Planilhas (Google Sheets/Excel), Captura de tela (nativa/Lightshot), Gravador de tela (Loom/OBS, opcional), Jira/Trello (opcional) para bugs.

## 6. Critérios

### 6.1. Critérios de Entrada

* Acesso ao site disponível.
* Dados de teste definidos (usuários e produtos padrões do catálogo).
* Casos de teste mínimos documentados (seção 9).

### 6.2. Critérios de Saída

* 100% dos casos de **smoke** executados.
* ≥ 90% dos casos de teste planejados executados.
* Nenhum defeito aberto de **Severidade Crítica/Alta**.
* Relatório final com status, métricas e lista de defeitos.

## 7. Dados de Teste

Contas padrão do Sauce Demo (senha comum: `secret_sauce`):

* `standard_user` – fluxo feliz (happy path).
* `locked_out_user` – usuário bloqueado (valida mensagem de erro).
* `problem_user` – expõe problemas visuais/links.
* `performance_glitch_user` – latência perceptível (valida tolerância a tempo de resposta).
* `error_user` e `visual_user` – comportamentos adicionais (opcional).

Dados de Checkout (exemplos):

* Nome: "Caroline" | Sobrenome: "Oliveira" | CEP: "40000-000" (válido)
* CEP inválido: "00" (valor limite) / string com letras.

## 8. Tipos e Níveis de Teste

* **Funcional de Sistema** (end‑to‑end manual dentro do site demo).
* **Usabilidade básica** (clareza de mensagens/fluxo).
* **Compatibilidade/Browser básico** (Chrome/Firefox).

## 9. Casos de Teste (Resumo)

| ID   | Título                         | Pré-condição                | Passos Resumidos                                         | Resultado Esperado                                         |
| ---- | ------------------------------ | --------------------------- | -------------------------------------------------------- | ---------------------------------------------------------- |
| TC01 | Login com credenciais válidas  | Site acessível              | Informar `standard_user` / `secret_sauce` e logar        | Redireciona ao catálogo; menu e ícone do carrinho visíveis |
| TC02 | Login com senha inválida       | –                           | Usuário válido + senha inválida                          | Mensagem clara de erro; permanece na tela de login         |
| TC03 | Adicionar produto ao carrinho  | Autenticado                 | Clicar em "Add to cart" em um item                       | Contador do carrinho incrementa; item aparece no carrinho  |
| TC04 | Remover produto do carrinho    | Item previamente adicionado | Clicar em "Remove"                                       | Item removido; contador decrementa                         |
| TC05 | Ordenar produtos por preço     | Autenticado                 | Selecionar ordenação "Price (low to high)"               | Lista reordena corretamente (validação por amostragem)     |
| TC06 | Checkout – Campos obrigatórios | Item no carrinho            | Ir ao checkout e deixar campos vazios                    | Mensagens de obrigatoriedade exibidas; não prossegue       |
| TC07 | Checkout completo (happy path) | Item no carrinho            | Preencher Nome/Sobrenome/CEP válidos → Continue → Finish | Exibe confirmação de pedido                                |
| TC08 | Sair (logout)                  | Autenticado                 | Menu → Logout                                            | Retorna à página de login                                  |

> Os casos completos (com passos detalhados e evidências) serão mantidos em `test-cases/`.

## 10. Severidade x Prioridade

### 10.1. Definições de Severidade

* **Crítica:** impede processamento do fluxo principal (ex.: impossibilidade de login para usuário padrão, falha no checkout).
* **Alta:** funcionalidade principal comprometida, mas com contorno limitado (ex.: não é possível remover item do carrinho).
* **Média:** problema funcional não‑bloqueante ou impacto moderado (ex.: ordenação incorreta em critério secundário).
* **Baixa:** cosmético/UX menor (ex.: alinhamento, texto truncado sem perda de entendimento).

### 10.2. Definições de Prioridade

* **P1 (Urgente):** corrigir antes da entrega/encerramento do ciclo.
* **P2 (Alta):** planejar para próxima iteração curta.
* **P3 (Média):** corrigir quando possível sem risco ao cronograma.
* **P4 (Baixa):** backlog; não impeditivo.

## 11. Gestão de Defeitos

* Registro via planilha ou ferramenta (ex.: Jira/GitHub Issues).
* Cada bug deve conter: título claro, passos para reproduzir, resultado esperado x obtido, severidade, prioridade, evidências (print/vídeo), ambiente e data.
* **Ciclo:** Novo → Em análise → Em correção → Em validação → Fechado / Reaberto.

## 12. Métricas

* % de execução (casos executados / planejados).
* Taxa de aprovação (pass) e reprovação (fail).
* Densidade de defeitos (bugs/funcionalidade ou bugs/caso executado).
* Taxa de reabertura.

## 13. Riscos e Mitigações

* **Intermitência/latência (performance\_glitch\_user):** repetir teste com conta padrão; registrar tempo aproximado e evidência.
* **Mudanças no ambiente demo:** documentar data/hora e evidências; priorizar smoke para validar estabilidade antes do ciclo.
* **Dados voláteis (catálogo):** validar por amostra; focar no comportamento (não em nomes exatos de itens).

## 14. Cronograma (proposta)

* **Dia 1:** Smoke + Casos de Login/Catálogo (TC01–TC05).
* **Dia 2:** Carrinho/Checkout (TC06–TC07) + Exploratório focado no checkout.
* **Dia 3:** Regressão leve + Cross‑browser básico + Consolidação de relatório.

## 15. Entregáveis

* Plano de Testes (este documento) – `/docs/plano-de-testes.md`.
* Casos de Teste detalhados – `/test-cases/` (planilha/markdown).
* Relatórios de Bugs – `/bug-reports/` (um por bug ou um consolidado com seções).
* Evidências (prints/vídeos) – `/evidencias/`.
* Relatório Final de Testes – `/docs/relatorio-final.md`.

## 16. Matriz de Rastreabilidade (exemplo)

| Requisito               | Casos de Teste   |
| ----------------------- | ---------------- |
| R1 Login                | TC01, TC02, TC08 |
| R2 Catálogo/Ordenação   | TC05             |
| R3 Carrinho             | TC03, TC04       |
| R4 Checkout             | TC06, TC07       |
| R5 Mensagens/Validações | TC02, TC06       |

---

### Anexos/Notas

* Usuários de teste e senha padrão documentados na seção 7.
* Evidências devem conter data/hora e navegador utilizado.
* Em caso de falha intermitente, repetir 2–3 vezes e registrar a taxa de ocorrência.

