#!/bin/bash
# Script to manage "tac_plus-ng" service

case "$1" in
  build)
    docker image rm tacacs:latest --force && docker build -f Dockerfile -t tacacs:latest .
    ;;
  create)
    docker run --name tac_plus-ng -p 49:4949 -v $(pwd)/etc/tacacs-cyber.cfg:/usr/local/etc/tac_plus-ng.cfg -v $(pwd)/log/:/var/log/ -d -t --restart=always tacacs:latest
    ;;
  start)
    docker start tac_plus-ng
    ;;
  status)
    docker stats tac_plus-ng
    ;;
  restart)
    docker restart tac_plus-ng
    ;;
  stop)
    docker stop tac_plus-ng
    ;;
  remove)
    docker rm tac_plus-ng
    ;;
  *) 
    echo "Usage: $0 {build|create|start|status|restart|stop|remove}"
    exit 1
    ;;
esac

exit 0
