# Human_following_robot
A meticulous and robust system for object detection and tracking is still a milestone in the field of computer vision. The various factors that hinder the accuracy of the model includes illumination, noise in the scene, occlusion effect and pose variations of which the source of illumination and its orientation with respect to the object plays a pivotal role. An illumination variation may result in the tracking algorithm to lose the object in the scene. This paper proposes a simulation of a robot which follows a human under varying illumination. The camera on the robot is aided by a histogram of oriented gradients (HOG) approach with an SVM classifier for detection and tracking of the human in the scene with a turtlebot.

## Virtual Machine
Download the Virtual machine as described in  https://www.mathworks.com/robotics/v3/ros_vm_install to install VM with ROS and Gazebo.

## Matlab
You can install Matlab from https://www.mathworks.com/products/matlab.html

## Dependencies in Matlab
You need to install Matlab's navigation toolbox, computer vision toolbox, Robotics toolbox for this to work. 

# How to run
Once you are done with installing all the dependencies, you are now good to go.
Start the Virtual machine mounted with ROS indigo. Open an empty scene with just the turtlebot. Open two instances of matlab to run both the detection code along with the movement code simultaneously. Run the movesh.m and the human_detection.m files simultaneously on two separate matlab applications. The robot will now follow the human who moves in a fixed trajectory. 
AR presentation.pdf contains the slides for the final presentation.
