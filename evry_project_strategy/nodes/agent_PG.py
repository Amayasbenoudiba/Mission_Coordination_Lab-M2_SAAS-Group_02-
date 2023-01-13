#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import Twist, Pose2D
from sensor_msgs.msg import Range
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from evry_project_plugins.srv import DistanceToFlag
from std_msgs.msg import Empty
from math import pi, sqrt, atan2, cos, sin
import numpy as np
from numpy import linalg as LA

import math


class Robot:
    def __init__(self, robot_name):
        """Constructor of the class Robot
        The required publishers / subscribers are created.
        The attributes of the class are initialized

        Args:
            robot_name (str): Name of the robot, like robot_1, robot_2 etc. To be used for your subscriber and publisher with the robot itself
        """
        self.speed = 0.0
        self.angle = 0.0
        self.sonar = 0.0  # Sonar distance
        self.x, self.y = 0.0, 0.0  # coordinates of the robot
        self.yaw = 0.0  # yaw angle of the robot
        self.robot_name = robot_name
        self.trajectory = list()

        '''Listener and publisher'''

        rospy.Subscriber(self.robot_name + "/sensor/sonar_front",
                         Range, self.callbackSonar)
        rospy.Subscriber(self.robot_name + "/odom",
                         Odometry, self.callbackPose)
        self.cmd_vel_pub = rospy.Publisher(
            self.robot_name + "/cmd_vel", Twist, queue_size=1)

    def callbackSonar(self, msg):
        """Callback function that gets the data coming from the ultrasonic sensor

        Args:
            msg (Range): Message that contains the distance separating the US sensor from a potential obstacle
        """
        self.sonar = msg.range

    def get_sonar(self):
        """Method that returns the distance separating the ultrasonic sensor from a potential obstacle
        """
        return self.sonar

    def callbackPose(self, msg):
        """Callback function that gets the data coming from the ultrasonic sensor

        Args:
            msg (Odometry): Message that contains the coordinates of the agent
        """
        self.x = msg.pose.pose.position.x
        self.y = msg.pose.pose.position.y
        quaternion = msg.pose.pose.orientation
        quaternion_list = [quaternion.x,
                           quaternion.y, quaternion.z, quaternion.w]
        roll, pitch, yaw = euler_from_quaternion(quaternion_list)
        self.yaw = yaw

    def get_robot_pose(self):
        """Method that returns the position and orientation of the robot"""
        return self.x, self.y, self.yaw

    def constraint(self, val, min=-2.0, max=2.0):
        """Method that limits the linear and angular velocities sent to the robot

        Args:
            val (float): [Desired velocity to send
            min (float, optional): Minimum velocity accepted. Defaults to -2.0.
            max (float, optional): Maximum velocity accepted. Defaults to 2.0.

        Returns:
            float: Limited velocity whose value is within the range [min; max]
        """
        # DO NOT TOUCH
        if val < min:
            return min
        if val > max:
            return max
        return val

    def set_speed_angle(self, linear, angular):
        """Method that publishes the proper linear and angular velocities commands on the related topic to move the robot

        Args:
            linear (float): desired linear velocity
            angular (float): desired angular velocity
        """

        cmd_vel = Twist()
        cmd_vel.linear.x = self.constraint(linear)
        cmd_vel.angular.z = self.constraint(angular, min=-1, max=1)
        self.cmd_vel_pub.publish(cmd_vel)

    def getDistanceToFlag(self):
        """Get the distance separating the agent from a flag. The service 'distanceToFlag' is called for this purpose.
        The current position of the robot and its id should be specified. The id of the robot corresponds to the id of the flag it should reach


        Returns:
            float: the distance separating the robot from the flag
        """
        rospy.wait_for_service('/distanceToFlag')
        try:
            service = rospy.ServiceProxy('/distanceToFlag', DistanceToFlag)
            pose = Pose2D()
            pose.x = self.x
            pose.y = self.y
            # int(robot_name[-1]) corresponds to the id of the robot. It is also the id of the related flag
            result = service(pose, int(self.robot_name[-1]))
            return result.distance
        except rospy.ServiceException as e:
            print("Service call failed: %s" % e)


class RobotController:

    def __init__(self, robot_name):
        """
        Constructor of the class RobotController
        The robot class is initialized and it's passed the robot_name
        The attributes of the class are initialized

        Args:
            robot_name (str): Name of the robot, like robot_1, robot_2 etc. To be used for your subscriber and publisher with the robot itself
        """
        self.robot_name = robot_name    # Store the name of the robot in an attribute
        # Create an instance of the Robot class and store it in an attribute
        self.robot = Robot(robot_name)
        # Initialize the Kpv attribute which represents the Proportional gain of the velocity
        self.Kpv = 0.9
        # Initialize the Kpa attribute which represents the Proportional gain of the angle
        self.Kpa = 0.5

    def run(self):
        print(f"Robot : {self.robot_name} is starting..")

        # Timing
        rospy.sleep(1)
        x, y, theta = self.robot.get_robot_pose()
        distance = float(self.robot.getDistanceToFlag())
        goal_x = math.cos(theta) * distance
        goal_y = math.sin(theta) * distance

        while not rospy.is_shutdown():
            # Strategy
            distance = float(self.robot.getDistanceToFlag())
            print(f"{self.robot_name} distance to flag = ", distance)

            # Write here your strategy..
            if distance > 50:
                angle = 0.1
                velocity = 2
            else:
                x, y, theta = self.robot.get_robot_pose()
                desired_angle_goal = math.atan2(goal_y-y, goal_x-x)
                print(f"{self.robot_name} desired_angle = ",
                      desired_angle_goal)

                angle = (desired_angle_goal-theta-0.05)*self.Kpa
                velocity = self.Kpv * distance

                if distance < 5:
                    self.Kpv = 0.2
                if distance < 1:
                    self.Kpv = 0

            # Finishing by publishing the desired speed.
            # Set the speed and angle of the robot
            self.robot.set_speed_angle(velocity, angle)
            rospy.sleep(0.5)


if __name__ == "__main__":
    print("Running ROS..")
    rospy.init_node("Controller", anonymous=True)
    Robot_name = rospy.get_param("~robot_name")
    controller = RobotController(Robot_name)
    controller.run()
