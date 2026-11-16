#!/bin/bash

# Zezwolenie na połączenia graficzne
xhost +local:root

# Zbudowanie obrazu na podstawie Dockerfile
docker build -t ros2_projekt_image .

# Uruchomienie kontenera z odpowiednimi uprawnieniami
docker run -it --rm \
    --net=host \
    --env="DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --device=/dev/video0:/dev/video0 \
    --volume="$(pwd)/src:/ros2_ws/src:rw" \
    ros2_projekt_image bash -c "source /opt/ros/humble/setup.bash && bash"
