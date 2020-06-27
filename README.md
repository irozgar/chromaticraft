# Chromaticraft server image generation

Files to generate the docker image of the minecraft server chromaticraft


## Building the image

```bash
$ docker build . -t chromaticraft:<version>
```


## Running the image

```bash
$ docker pull docker.pkg.github.com/irozgar/chromaticraft/chromaticraft:latest
$ docker run -d --name chromaticraft \
             --restart unless-stopped \
             -p 25565:25565 \
             -v $(pwd)/world:/minecraft/world \
             -v $(pwd)/world_nether:/minecraft/world_nether \
             -v $(pwd)/world_the_end:/minecraft/world_the_end \
             -v $(pwd)/whitelist.json:/minecraft/whitelist.json \
             docker.pkg.github.com/irozgar/chromaticraft/chromaticraft:latest
```
