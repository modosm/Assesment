# syntax=docker/dockerfile:1
FROM ubuntu:22.04
# ENV USERNAME=$USERNAME
CMD [ -z "$USERNAME" ] && echo "Hello World\!" || echo "Hello $USERNAME\!"