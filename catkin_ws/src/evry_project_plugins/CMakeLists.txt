cmake_minimum_required(VERSION 2.8.3)
project(evry_project_plugins)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  roscpp
  std_msgs
  message_generation
  gazebo_ros
)

find_package(gazebo REQUIRED)

add_service_files(FILES DistanceToFlag.srv)

generate_messages(DEPENDENCIES geometry_msgs std_msgs)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES evry_project_plugins
#  CATKIN_DEPENDS geometry_msgs roscpp rospy tf
#  DEPENDS system_lib
)

link_directories(${GAZEBO_LIBRARY_DIRS})

include_directories(
 include
 ${catkin_INCLUDE_DIRS}
 ${GAZEBO_INCLUDE_DIRS}
)

add_library(distance_to_flag_plugin src/distance_to_flag_plugin.cpp)
target_link_libraries(distance_to_flag_plugin ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})
add_dependencies(distance_to_flag_plugin ${PROJECT_NAME}_gencpp)
