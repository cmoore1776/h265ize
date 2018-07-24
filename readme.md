# h265ize

Docker image for [h265ize](https://github.com/FallingSnow/h265ize)

With the container running, move videos to your input directory and h265ize will automatically convert them to h.265 as per your settings.

You can add any of the options mentioned on the [official h265ize GitHub page](https://github.com/FallingSnow/h265ize#options) after the image name.

## standalone example

```
docker run --rm -it -u $(id -u) -v $(pwd)/input:/input -v $(pwd)/output:/output shamelesscookie/h265ize -q 19 -m medium
```

## docker-compose example

```
version: '2'
services:
  rtmp:
    container_name: h265ize
    image: shamelesscookie/h265ize
    restart: always
    volumes:
      - /home/me/h265ize/input:/input
      - /home/me/h265ize/output:/output
    command: -q 19 -m medium
```