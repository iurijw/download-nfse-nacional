# Download NFS-e Nacional (em lote)

"Algo tão simples não deveria ser difícil, muito menos cobrado."

Baixe os XMLs das suas NFS-e (emitidas e recebidas) direto da **API oficial do ADN** (`adn.nfse.gov.br`), usando seu certificado digital. Sem captcha, sem instalar programa, sem enviar dados a terceiros.

## Como usar

1. Baixe o código: **[clique aqui para baixar o ZIP](https://github.com/iurijw/download-nfse-nacional/archive/refs/heads/main.zip)** (ou botão verde **Code → Download ZIP**).
2. Extraia o ZIP em qualquer pasta.
3. Dê **duplo clique em `NFSe Downloader.bat`**.
4. Na página que abrir, clique em **"Selecionar certificado…"**, escolha seu certificado na janela do Chrome e feche a aba que abriu.
5. Clique em **"Testar conexão"** e depois em **"Baixar notas"**. Um ZIP com os XMLs (organizados por mês) e um resumo `.csv` será baixado.

O campo **"Último NSU já baixado"** é salvo por CNPJ no navegador: na próxima vez, só as notas novas são baixadas. Você pode editar o valor manualmente (use `0` para baixar tudo de novo).

## O que cada arquivo faz

| Arquivo | Função |
|---|---|
| `NFSe Downloader.bat` | Abre o Chrome/Edge em um **perfil separado** com a checagem de origem (CORS) desativada — sem isso, o navegador bloqueia a leitura das respostas da API do governo. Não altera nada no seu Chrome normal. |
| `nfse-downloader.html` | A aplicação inteira, em um único arquivo. Consulta a API oficial (`GET /contribuintes/DFe/{nsu}?lote=true`), descompacta os XMLs, detecta a empresa do certificado, aplica os filtros e monta o ZIP — tudo localmente, no seu navegador. |

## Segurança e código aberto

- **Todo o código está neste repositório**, em um único HTML legível, sem bibliotecas externas. Qualquer pessoa pode auditar.
- A página se comunica **apenas com `adn.nfse.gov.br`** (servidor do governo). Nenhum dado seu sai do seu computador.
- **O certificado digital nunca é acessado pelo código**: quem o apresenta é o próprio Chrome/Windows, na conexão segura (mTLS). A página não consegue ler nem exportar o certificado.
- Sem conta, sem telemetria, sem limite de downloads.

## Requisitos

- Windows com Chrome ou Edge instalado.
- Certificado digital (e-CNPJ ou e-CPF): A1 instalado no Windows ou A3 no token/cartão.

## Avisos

- Use a janela aberta pelo `.bat` **somente para esta ferramenta** (a proteção de origem fica desativada nesse perfil dedicado).
- Para trocar de certificado/empresa, feche **todas** as janelas desse perfil dedicado e abra o `.bat` de novo.
- Notas canceladas são eventos separados no feed: o filtro "não baixar canceladas" só remove as canceladas cujo evento esteja no intervalo baixado. Para limpar todo o histórico, baixe a partir do NSU `0`.
