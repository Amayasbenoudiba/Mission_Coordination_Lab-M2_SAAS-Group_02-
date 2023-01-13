cmake_minimum_required(VERSION 2.8.3)
project(evry_project_strategy)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  roscpp
  rospy
  sensor_msgs
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES evry_project_strategy
#  CATKIN_DEPENDS geometry_msgs roscpp rospy sensor_msgs
#  DEPENDS system_lib
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)
