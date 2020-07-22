# shinyPWA

Um simples organizador de PWAS para funcionar no Shiny

<div align = "center">
<br>
<img src="./img/logo.png" height=260>
<br>
<br>

[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg?longCache=true&style=for-the-badge)](https://saythanks.io/to/lucas.carotta%40outlook.com)

[![English README](https://img.shields.io/badge/Language-EN-blue.svg?longCache=true&style=for-the-badge)](./README.md)
[![Portuguese README](https://img.shields.io/badge/Linguagem-PT-green.svg?longCache=true&style=for-the-badge)](./README.pt-br.md)

[![made-with-r](https://img.shields.io/badge/Made%20with-R-1f425f.svg?style=flat-square)](https://www.r-project.org/)
[![made-with-docker](https://img.shields.io/badge/Made%20with-Docker-important?style=flat-square)](https://www.docker.com/)
[![made-with-vscode](https://img.shields.io/badge/made%20with-vscode-blueviolet?style=flat-square)](https://code.visualstudio.com/)
[![GPL license](https://img.shields.io/badge/License-GPL-blue.svg?style=flat-square)](https://github.com/Fazendaaa/shinyPWA/LICENSE.html)
[![GitHub release](https://img.shields.io/github/release/Fazendaaa/shinyPWA.svg?style=flat-square)](https://github.com/Fazendaaa/shinyPWA/releases/)

</div>

## Introdução

Após escrever [este](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo-ckcfwjz380058kns13oye8f03) blogpost sobre a stack **R + Shiny + Mongo + Docker** ([RSMD](https://github.com/Fazendaaa/RSMD)), comentei nele sobre utilizar o pacote [`shinyMobile`](https://github.com/RinteRface/shinyMobile), porem para a minha surpresa ele é construído usando [Framework7](https://framework7.io/).

Então para poder utilizar uma experiência de Progressive Web Apps (PWA) no meu post, decidi escrever **mais um pacote PWA** para fazer o exemplo -- que é baseado no [`shinyDashboard`](https://github.com/rstudio/shinydashboard) -- funcionar.

### Docker

Como quase todos os meus projetos, desenvolvi este utilizando [Docker](https://www.docker.com/), você pode encontrar uma [imagem](https://hub.docker.com/r/fazenda/shinypwa) com este pacote já preparada para as seguintes arquiteturas:

- 386
- amd64
- arm/v6
- arm/v7
- arm64/v8
- s390x
- ppc64le

## Instalando

```R
devtools::install_github('Fazendaaa/shinyPWA')
```

## Usando

Há apenas uma função que este pacote exporta, a `shinyPWA`. Aqui o exemplo dela no projeto [`R + Shiny + Mongo + Docker`](https://github.com/Fazendaaa/RSMD):

```R
...
  dashboardBody(
        shinyPWA(list(
            hasIcons = TRUE,
            version = 'v1',
            shortname = 'RSMD',
            name = 'R + Shiy + Mongo + Docker',
            display = 'standalone',
            backgroundcolor = '#fdfdfd',
            themecolor = '#db4938',
            orientation = 'portrait-primary'
        )),
        tabItems(
...
```

**Mesmo utilizando o [shinydashboard](https://github.com/rstudio/shinydashboard), você pode utilizar o shinyPWA sem o pacote do dashboard.**

Caso a opção `hasIcons` seja `TRUE` você precisará seguir os passos descritos no tópico de [icones](#icones).

### Icones

Caso faça ícones para a sua aplicação, apenas crie uma pasta `icons` no seu diretório `www` e os coloque nela:

```shell
...
 |
 |- www/
 |   |- icons/
 |   |    |- myFirstIcon.png
 |   |    |- mySecondIcon.png
 |   |    |- myThirdIcon.png
 |  ...  ...
...
```

Você não precisará colocar a proporção da imagem como é comum em projetos PWA. Só algo como `my-icon-52x52.png` não será necessário, apenas escreva `my-icon.png` e tudo será configurado automaticamente.

## Contribuindo

### Testes

Para rodar os testes deste pacote:

```shell
docker run -it fazenda/shinypwa R -e "devtools::test()"
```

E se você gostaria de contribuir com algum código, antes de abrir um novo Pull Request (PR), rode:

```shell
docker run -it --volume $(pwd):/test --workdir /test fazenda/shinypwa R -e "devtools::test()"
```

obs: claro que isto não funcionará caso adicionar alguma nova dependência ao preojto, então o [Dockerfile](./Dockerfile) utilizado também é disponibilizado para ajudar no desenvolvimento

## A fazer

- Testes
- Melhor documentação
- Escrever um `CONTRIBUTING.md`
- Pastas com exemplos
- Publicar no CRAN

## Autor

- [Fazendaaa](https://github.com/Fazendaaa)

## Licença

Este projeto é distribuido sob a [GNU v2](./LICENSE)

## Referências

- [Build a PWA from scratch with HTML CSS and JavaScript](https://www.freecodecamp.org/news/build-a-pwa-from-scratch-with-html-css-and-javascript/#what-is-a-progressive-web-app)
