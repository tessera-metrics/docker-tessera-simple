# Simple Tessera Container

A simple Docker container for
[Tessera](https://github.com/aalpern/tessera), which runs Tessera
out of the `master` branch on github with the demo dashboards
installed.

Starting this container will bind the following ports by default:

* `80`: the Tessera user interface and API

You can get up and running with an existing graphite instance by
setting the `GRAPHITE_URL` environment variable in your `docker`
invocation:

```
docker run -P -e GRAPHITE_URL=http://graphite.host:port -it tesserametrics/tessera-simple
```

```
docker run -d\
 --name tessera\
 --restart=always\
 -p 5000:5000\
 tesserametrics/tessera-simple
```
