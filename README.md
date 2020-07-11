# ShinyPWA

A simple PWA bundler to work with Shiny Dashboard

<div align = "center">
<br>
<img src="./img/logo.png" height=260>
<br>
<br>

[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg?longCache=true&style=for-the-badge)](https://saythanks.io/to/lucas.carotta%40outlook.com)

[![English README](https://img.shields.io/badge/Language-EN-blue.svg?longCache=true&style=for-the-badge)](./README.md)
[![Portuguese README](https://img.shields.io/badge/Linguagem-PT-green.svg?longCache=true&style=for-the-badge)](./docs/readme/README.pt-br.md)

[![made-with-r](https://img.shields.io/badge/Made%20with-R-1f425f.svg?style=flat-square)](https://www.r-project.org/)
[![made-with-docker](https://img.shields.io/badge/Made%20with-Docker-important?style=flat-square)](https://www.docker.com/)
[![made-with-vscode](https://img.shields.io/badge/made%20with-vscode-blueviolet?style=flat-square)](https://code.visualstudio.com/)
[![GPL license](https://img.shields.io/badge/License-GPL-blue.svg?style=flat-square)](https://github.com/Fazendaaa/ShinyPWA/LICENSE.html)
[![GitHub release](https://img.shields.io/github/release/Fazendaaa/ShinyPWA.svg)](https://github.com/Fazendaaa/ShinyPWA/releases/)

</div>

## Intro

After writing [this](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo-ckcfwjz380058kns13oye8f03) blogpost about a R + Shiny + Mongo + Docker ([RSMD](https://github.com/Fazendaaa/RSMD)) stack, I've pointed out about [`shinyMobile`](https://github.com/RinteRface/shinyMobile) pacakge, but to my suprise it's built on to of the [Framework7](https://framework7.io/). So to complement the example shown in my post, I've decided to built **yet another PWA package** to allow my example -- which is based in [`shinyDashboard`](https://github.com/rstudio/shinydashboard) -- to have a proper "PWA" experience.

### Docker

As almost any of my projects by now, I've developed by using [Docker](https://www.docker.com/), so you can find an [image](https://hub.docker.com/r/fazenda/shinypwa) already built to use to test this package in the following architectures:

- 386
- amd64
- arm/v6
- arm/v7
- arm64/v8
- s390x
- ppc64le

## Contributing

### Tests

To run the current tests just:

```shell
docker run -it fazenda/shinypwa R -e "devtools::test()"
```

And if you want to contribute with some code, before opening a new Pull Request (PR) just run:

```shell
docker run -it --volume $(pwa):/usr/src/app fazenda/shinypwa R -e "devtools::test()"
```

note: of course this will break and not run if you add a new dependency to the package, so a [Dockerfile](./Dockerfile) is also provided to aid you in the development\

## TODO

- Better docs
- Examples
- Tests
- Deploy it to CRAN

## Author

- [Fazendaaa](https://github.com/Fazendaaa)

## License

This project is licensed under the [GNU v2](./LICENSE)

## References
