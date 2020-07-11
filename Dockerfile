FROM estat/rlang

WORKDIR /src/usr/app

COPY DESCRIPTION .

RUN [ "R", "-e", "remotes::install_local('.')" ]

COPY . .
