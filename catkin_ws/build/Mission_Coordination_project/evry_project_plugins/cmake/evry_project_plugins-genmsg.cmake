# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "evry_project_plugins: 0 messages, 1 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(evry_project_plugins_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv" NAME_WE)
add_custom_target(_evry_project_plugins_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "evry_project_plugins" "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv" "geometry_msgs/Pose2D"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(evry_project_plugins
  "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/evry_project_plugins
)

### Generating Module File
_generate_module_cpp(evry_project_plugins
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/evry_project_plugins
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(evry_project_plugins_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(evry_project_plugins_generate_messages evry_project_plugins_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv" NAME_WE)
add_dependencies(evry_project_plugins_generate_messages_cpp _evry_project_plugins_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(evry_project_plugins_gencpp)
add_dependencies(evry_project_plugins_gencpp evry_project_plugins_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS evry_project_plugins_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(evry_project_plugins
  "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/evry_project_plugins
)

### Generating Module File
_generate_module_eus(evry_project_plugins
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/evry_project_plugins
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(evry_project_plugins_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(evry_project_plugins_generate_messages evry_project_plugins_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv" NAME_WE)
add_dependencies(evry_project_plugins_generate_messages_eus _evry_project_plugins_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(evry_project_plugins_geneus)
add_dependencies(evry_project_plugins_geneus evry_project_plugins_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS evry_project_plugins_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(evry_project_plugins
  "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/evry_project_plugins
)

### Generating Module File
_generate_module_lisp(evry_project_plugins
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/evry_project_plugins
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(evry_project_plugins_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(evry_project_plugins_generate_messages evry_project_plugins_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv" NAME_WE)
add_dependencies(evry_project_plugins_generate_messages_lisp _evry_project_plugins_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(evry_project_plugins_genlisp)
add_dependencies(evry_project_plugins_genlisp evry_project_plugins_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS evry_project_plugins_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(evry_project_plugins
  "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/evry_project_plugins
)

### Generating Module File
_generate_module_nodejs(evry_project_plugins
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/evry_project_plugins
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(evry_project_plugins_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(evry_project_plugins_generate_messages evry_project_plugins_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv" NAME_WE)
add_dependencies(evry_project_plugins_generate_messages_nodejs _evry_project_plugins_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(evry_project_plugins_gennodejs)
add_dependencies(evry_project_plugins_gennodejs evry_project_plugins_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS evry_project_plugins_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(evry_project_plugins
  "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/evry_project_plugins
)

### Generating Module File
_generate_module_py(evry_project_plugins
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/evry_project_plugins
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(evry_project_plugins_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(evry_project_plugins_generate_messages evry_project_plugins_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/Mission_Coordination_project/evry_project_plugins/srv/DistanceToFlag.srv" NAME_WE)
add_dependencies(evry_project_plugins_generate_messages_py _evry_project_plugins_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(evry_project_plugins_genpy)
add_dependencies(evry_project_plugins_genpy evry_project_plugins_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS evry_project_plugins_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/evry_project_plugins)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/evry_project_plugins
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(evry_project_plugins_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(evry_project_plugins_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/evry_project_plugins)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/evry_project_plugins
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(evry_project_plugins_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(evry_project_plugins_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/evry_project_plugins)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/evry_project_plugins
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(evry_project_plugins_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(evry_project_plugins_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/evry_project_plugins)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/evry_project_plugins
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(evry_project_plugins_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(evry_project_plugins_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/evry_project_plugins)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/evry_project_plugins\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/evry_project_plugins
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(evry_project_plugins_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(evry_project_plugins_generate_messages_py std_msgs_generate_messages_py)
endif()
