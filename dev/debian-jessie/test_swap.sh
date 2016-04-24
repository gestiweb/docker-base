docker run -itd  --name debian-jessie-dev --hostname debian-jessie-dev --memory-swappiness=99 -m 256M --memory-reservation 8M --oom-kill-disable=true --memory-swap=-1 gestiweb/debian-jessie:latest
