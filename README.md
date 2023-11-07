# PHP(Laravel) and WebGL(Babylon.js) game sample for newbie!

- [Laravel](https://laravel.com/) Game Server
- WebGL Game Client
    - [Babylon.js](https://www.babylonjs.com/)
- docker compose for local environment

## Install

```sh
git clone https://github.com/il-m-yamagishi/newbie-training-sample.git
cd newbie-training-sample
./app install
./app start
[Ctrl+C to stop]
```

- Access to http://localhost to show user landing page.
- Access to http://localhost:30080/admin/ to show administrator landing page.

## FAQ

### `Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?`

This environment needs docker running. [Please install docker and docker compose cli](https://docs.docker.com/engine/install/).
