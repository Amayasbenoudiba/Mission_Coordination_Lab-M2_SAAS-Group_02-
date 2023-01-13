# Mission_Coordination_Lab-M2_SAAS-Group_02
This project simulates 3 robots using ROS 1 &amp; Gazebo. The goal is to move them from start to their respective flags while avoiding collisions. Main goal is to reach the flags as fast as possible. The robots have a limited range ultrasonic sensor, motorized wheels &amp; known position &amp; orientation.

**Mission_coordination lab , assisted by teewende boris kiema, 2022**
--

> Simulating efficient and collision-free movement of multiple robots

**_About_**
--
This repository contains the solutions for the final project for the Mission Coordination course at Université d'Évry paris saclay. It's an simulation of three robots using ROS 1 and Gazebo, the objective is to move the robots from a starting position to their respective flags while avoiding collisions with other robots and reach the flags as quickly as possible. The simulated robots have an ultrasonic sensor with a limited range of 5 meters, 2 motorized wheels for movement, and their current position and orientation in the environment is known. The solutions were prepared by Amayas BENOUDIBA and Juba SID as part of Activity Group 2.

**Approach**
--

**1. Time delay**

> 
> To achieve the objective of moving the robots to their respective flags while avoiding collisions, we implemented a strategy using a delay to stagger the start time of each robot. This allows the robots to move in a coordinated manner and avoid collisions.
> The robots are able to detect the distance to the flag and adjust their speed accordingly, they stop when they reach the flags and this solution is open loop which means that we don't take into account the position of the flags while the robots are moving.
> However, this solution may not be efficient if the position of the flags are changed during the execution of the program.



https://user-images.githubusercontent.com/78215481/212317681-eda8f829-28d5-4158-97aa-7a68404d10a8.mp4


**2. Proportional gain control for motion coordination** 

> The code implements the RobotController class which is responsible for controlling the movement of a single robot in the simulation. The class takes in the name of the robot as an argument and creates an instance of the Robot class, which is used to interface with the robot's hardware and sensor data. The run method is the main control loop for the robot, which handles the timing, motion control, and distance detection.
> The Kpv and Kpa attributes represent the Proportional gain of the velocity and angle respectively, which are used to control the speed and angle of the robot. The method starts by initializing the goal position for the robot, then it enters a loop that continuously updates the robot's position and calculates the desired angle and velocity to reach the goal, the robot uses Proportional gain control to adjust its speed and angle.
> The algorithm also handles the case of when the robot is close to the flag, it reduces the speed and stops when it reaches the flag. The run method also includes delay time to ensure that the robots move in a coordinated manner and avoid collisions. The set_speed_angle method is used to control the robot's movement, and the getDistanceToFlag method is used to detect the distance to the flag.
> 

**3. Obstacle Avoidance and Convergence Strategy**

> This solution utilizes a combination of strategies to navigate the robot to its target flag while avoiding obstacles in its path. The code begins by initializing the robot and implementing a sleep delay to avoid collisions with other robots. The main loop of the program continuously updates the robot's distance to the flag, and utilizes a "delta distance" variable to track if the robot is getting closer or farther from the flag. If the robot is getting closer to the flag, it rotates left or right and moves forward until it reaches the flag. If the robot is getting farther from the flag, it utilizes an obstacle detection strategy. If the robot detects an obstacle within a certain range, it stops moving and waits for 2 seconds before resuming movement. Additionally, if the distance covered by the robot exceeds a certain threshold, it performs a sonar sensor sweep to check for obstacles in its path. This solution is an open-loop control and not efficient for a dynamic environment.
> 

https://user-images.githubusercontent.com/122572260/212318268-cafdcd03-f0b8-4594-9613-aa7f99ae46de.mp4



**4. PID-controlled Obstacle Avoidance and Flag Navigation**

> 
> The strategy implemented is a robust solution for navigating a robot towards a flag while avoiding obstacles. The script utilizes a PID controller to control the robot's speed based on the distance to the flag, which ensures that the robot moves at an appropriate speed towards the flag. Additionally, the script also controls the robot's angle based on the yaw angle, which ensures that the robot stays aligned towards the flag.
> Obstacle detection is performed using the robot's ultrasonic sensor, and if an obstacle is detected, the robot stops and turns to avoid it. The script also checks if the robot is moving away from the flag, and if so, it turns left to correct its course. If the distance to the flag is less than 2, the robot stops, which ensures that the robot does not overshoot the flag.
> All this features ensure that the robot is able to reach the flag safely and efficiently, and also makes sure that the robot does not crash into any obstacles.


https://user-images.githubusercontent.com/78215481/212318451-4cd4a5bf-7640-42a8-8723-3d47c8f90541.mp4



