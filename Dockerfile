FROM osrf/ros:humble-desktop

RUN apt-get update && apt-get install -y \
    ros-humble-usb-cam \
    ros-humble-cv-bridge \
    ros-humble-turtlebot3-gazebo \
    ros-humble-turtlebot3-teleop \
    python3-opencv \
    && rm -rf /var/lib/apt/lists/*

ENV TURTLEBOT3_MODEL=burger
WORKDIR /ros2_ws
