FROM estat/rlang

WORKDIR /src/usr/app

COPY DESCRIPTION .

RUN [ "apk", "add", "--no-cache", "libjpeg-turbo-dev", "tiff-dev", "libx11-dev" ]
RUN [ "R", "-e", "remotes::install_local('.')" ]

COPY . .
