#! /usr/bin/python

import time

# rospy for the subscriber
import rospy
# ROS Image message
from sensor_msgs.msg import Image
# ROS Image message -> OpenCV2 image converter
from cv_bridge import CvBridge, CvBridgeError
# OpenCV2 for saving an image
import cv2
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from rospy.numpy_msg import numpy_msg

worst_timing=0

# Instantiate CvBridge
bridge = CvBridge()

def check_if_passable(cv_2_image,y_upper_edge,y_lower_edge,x_upper_edge,x_lower_edge):
    check_window=cv_2_image[y_lower_edge:y_upper_edge , x_lower_edge:x_upper_edge]
    go_staright_matrix = np.zeros(shape=(y_upper_edge-y_lower_edge,x_upper_edge-x_lower_edge))+1   
    go_staright_matrix[check_window <10] = 0
    go_staright_matrix[check_window > 0.9] = 1
#   print go_staright_matrix
    if 0 in go_staright_matrix:
	return False
    return True
   





def image_callback(msg):
    global worst_timing
    height=msg.height
    width=msg.width
    cv_2_image=bridge.imgmsg_to_cv2(msg)
    y_upper_edge = 3*height/4 
    y_lower_edge = height/4
    x_upper_edge = 3*width/4 + 15
    x_lower_edge = width/4 -20
    central_movement_window=cv_2_image[y_lower_edge:y_upper_edge , x_lower_edge:x_upper_edge]
    cv2.imshow('image',cv_2_image)
    cv2.waitKey(1)
    #check if we can go straight
    straight=check_if_passable(cv_2_image,y_upper_edge,y_lower_edge,x_upper_edge,x_lower_edge)
    if (straight):
        print "we can go straight"
    else:
	initial_time=time.time()
	mid_height = (int)(height/2)
	mid_width = (int)(width/2)
	left=check_if_passable(cv_2_image,mid_height,0,mid_width,0)	
	if (left):
	    print "we can go left!"
	    current_delta=time.time()-initial_time
	    if current_delta>worst_timing:
		worst_timing=current_delta
	    print worst_timing,'[sec]'
	else:
	   right=check_if_passable(cv_2_image,height,mid_height,width,mid_width)
	   if (right):
	       print "we can go right!"
               current_delta=time.time()-initial_time
	       if current_delta>worst_timing:
	       	    worst_timing=current_delta
	       print worst_timing,'[sec]'
	   else:
	       print "YOURE TOO CLOSE!"	
               current_delta=time.time()-initial_time
	       if current_delta>worst_timing:
	       	    worst_timing=current_delta
	       print worst_timing,'[sec]'
	    


 

rospy.init_node('image_listener')
# Define your image topic
image_topic = "/camera/depth/image"
# Set up your subscriber and define its callback
rospy.Subscriber(image_topic, Image, image_callback)
# Spin until ctrl + c
rospy.spin()


