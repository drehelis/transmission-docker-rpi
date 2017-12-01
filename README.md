# transmission-docker-rpi
Transmission Docker container to run on your Raspberry Pi

## Build it
```
git clone https://github.com/autogun/transmission-docker-rpi.git
cd transmission-docker-rpi
docker build -t autogun/transmission .
```

## Run it
```
docker run -d --name transmission --restart=always \
	--volume="/mnt/wd600/transmission-client/config/:/transmission/config" \
	--volume="/mnt/wd600/:/transmission/downloands" \
	--volume="/mnt/wd600/transmission-client/watch/:/transmission/watch" \
	--publish=9091:9091 --publish 45555:45555/tcp --publish 45555:45555/udp \
	autogun/transmission
```
