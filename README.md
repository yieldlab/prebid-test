# prebid-test

## Quickstart

```
docker-compose up -d --build
```

Then open http://localhost.local:9090 and choose a test page.

Get container status:

```
docker-compose ps
```

## config

Source repo for the prebid projects as well as the source branches can be changed in the [.env](.env) file using the following variables:

- `PREBID_SERVER_SOURCE`: Source repo of the prebid-server project as a git cloneable URL.
- `PREBID_SERVER_BRANCH`: Source branch of the prebid-server project (e.g. master).
- `PREBID_JS_SOURCE`: Source repo of the prebid.JS project as a git cloneable URL.
- `PREBID_JS_BRANCH`: Source branch of the prebid.JS project (e.g. master).

(See the [docker-compose docs](https://docs.docker.com/compose/env-file/) for further infos on how docker-compose substitutes environment variables).

## prebid-server

To configure prebid-server use environment variables and place them as `KEY=value` into the [prebid-server.env](prebid-server.env). From [prebid-server docs](https://github.com/prebid/prebid-server/blob/master/docs/developers/configuration.md#available-options):

> Prebid Server will look for the prefix PBS_ on the environment variables, and map underscores (\_) to periods. For example, to set host_cookie.ttl_days via an environment variable, set PBS_HOST_COOKIE_TTL_DAYS to the desired value.


## Prebid.JS

To recompile the prebid.js source execute the following command:

```bash
docker-compose run build-prebid-js
```

This container will clone the prebid.js code and compile the source to `./test-pages/prebid.js/prebid.js`. This file can be manually overwritten but would be regenerated on re-running the command above.
