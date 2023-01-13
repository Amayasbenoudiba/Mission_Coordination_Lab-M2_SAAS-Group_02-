#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import Twist, Pose2D
from sensor_msgs.msg import Range
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion

from evry_project_plugins.srv import DistanceToFlag

# import
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
        self.sonar = 0.0           # Sonar distance
        self.x, self.y = 0.0, 0.0  # coordinates of the robot
        self.yaw = 0.0             # yaw angle of the robot
        self.robot_name = robot_name

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
        cmd_vel.linear.x = self.constraint(linear, min=-3.0, max=3.0)
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


def run_demo():
    """Main loop"""
    #from random import randint
    robot_name = rospy.get_param("~robot_name")
    robot = Robot(robot_name)
    print(f"Robot : {robot_name} is starting..")
    rospy.sleep(5)
    deltaD = 0
    previousD = robot.getDistanceToFlag()
    velocity = 2
    angle = 0
    distance_covered = 0
    while not rospy.is_shutdown():
        # Write here your strategy
        sonar = float(robot.get_sonar())
        distance = float(robot.getDistanceToFlag())
        deltaD = previousD - distance
        previousD = distance
        print(robot_name, "flag", round(robot.getDistanceToFlag(), 3), "sonar", sonar,
              'distance_covered', round(distance_covered, 3), 'deltaD', round(deltaD, 3))
        if deltaD < 0:
            # The robot is converging to the flag
            print(robot_name, 'converging..')
            # Turn the robot left
            robot.set_speed_angle(0, -1)
            rospy.sleep(3.14/2)
            # Move forward
            robot.set_speed_angle(2, 0)
            rospy.sleep(.5)
            robot.set_speed_angle(0, 0)
            if distance - robot.getDistanceToFlag() > 0:
                distance = robot.getDistanceToFlag()
                robot.set_speed_angle(2, 0)
                while distance - robot.getDistanceToFlag() >= 0:
                    distance = robot.getDistanceToFlag()
                    rospy.sleep(.5)
                robot.set_speed_angle(-2, 0)
                rospy.sleep(.5)
                robot.set_speed_angle(0, 0)
                print(robot_name, 'finished')
                rospy.signal_shutdown('')
            else:
                distance = robot.getDistanceToFlag()
                robot.set_speed_angle(0, 1)
                rospy.sleep(3.14)
                robot.set_speed_angle(2, 0)
                while distance - robot.getDistanceToFlag() >= 0:
                    distance = robot.getDistanceToFlag()
                    rospy.sleep(.5)
                robot.set_speed_angle(-2, 0)
                rospy.sleep(.5)
                robot.set_speed_angle(0, 0)
                print(robot_name, 'finished')
                rospy.signal_shutdown('')
        else:
            if sonar < 3:
             # There is an obstacle ahead
                print(robot_name, 'obstacle ahead')
                velocity = 0
            else:
                velocity = 2
        # if distance covered by the robot is greater than 26.5,
        # it starts checking if there's an obstacle in its path
        # by doing a sweep using the sonar sensor.
            if distance_covered > 27:
                print(robot_name, "checking..")
                seen = False
                robot.set_speed_angle(0, .5)
        # the robot rotates left and right to check if there's an obstacle in its path
                for j in range(11):
                    if robot.get_sonar() < 4:
                        seen = True
                    else:
                        None
                    rospy.sleep(.1)
                robot.set_speed_angle(0, -.5)
                for j in range(21):
                    if robot.get_sonar() < 4:
                        seen = True
                    else:
                        None
                    rospy.sleep(.1)
                robot.set_speed_angle(0, .5)
                for j in range(11):
                    if robot.get_sonar() < 4:
                        seen = True
                    else:
                        None
                    rospy.sleep(.1)
                robot.set_speed_angle(0, 0)
                # if it detects an obstacle, it stops moving and waits for 2 seconds
                # multiplied by the last digit of the robot name
                if seen:
                    print(robot_name, 'sweep detected obstacle')
                    rospy.sleep(2 * int(robot_name[-1]))
                distance_covered = -100
        distance_covered += deltaD
        # Finishing by publishing the desired speed. DO NOT TOUCH.
        robot.set_speed_angle(velocity, angle)
        rospy.sleep(.1)


if __name__ == "__main__":
    print("navigate and avoid methode")
    rospy.init_node("Controller", anonymous=True)
    run_demo()
