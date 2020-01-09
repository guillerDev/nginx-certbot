# Boilerplate for nginx with Let’s Encrypt on docker-compose

> This repository is accompanied by a [step-by-step guide on how to
set up nginx and Let’s Encrypt with Docker](https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71).

`init-letsencrypt.sh` fetches and ensures the renewal of a Let’s
Encrypt certificate for one or multiple domains in a docker-compose
setup with nginx. Replace app.template domain variable with the certified domain.
This is useful when you need to set up nginx as a reverse proxy for an
application.

## Installation
1. [Install docker-compose](https://docs.docker.com/compose/install/#install-compose).

2. Clone this repository: `git clone https://github.com/guillerDev/nginx-certbot.git .`


3. Run the init script:

        ./init-letsencrypt.sh -d {DOMAIN HERE} -e {YOUR EMAIL}

4. Run the server:

        docker-compose up

## License
All code in this repository is licensed under the terms of the `MIT License`. For further information please refer to the `LICENSE` file.
