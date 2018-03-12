#!/usr/bin/env python

import rospy

import cv2

from sensor_msgs.msg import Image

from cv_bridge import CvBridge

import numpy as np


def range(depth_array):
    return np.min(depth_array[np.nonzero(np.nan_to_num(depth_array))]) * 100


def navigation_decision(depth_array):

    [height, width]=depth_array.shape

    #forward window
    y_upper_edge = 3 * height / 4
    y_lower_edge = height / 4

    x_upper_edge_left   = width / 3 -(width / 8)
    x_lower_edge_left   = width / 3 + 15

    x_lower_edge_center = width / 3 + 15
    x_upper_edge_center = 2*width / 3 -(width / 8)

    x_lower_edge_right  = 2*width / 3 +15
    x_upper_edge_right  = width - (width / 8)

    check_window_right  = depth_array[y_lower_edge:y_upper_edge, x_lower_edge_right:x_upper_edge_right]
    check_window_center = depth_array[y_lower_edge:y_upper_edge, x_lower_edge_center:x_upper_edge_center]
    check_window_left   = depth_array[y_lower_edge:y_upper_edge, x_upper_edge_left:x_lower_edge_left]
    range_right =  range(check_window_right)
    range_center = range(check_window_center)
    range_left = range(check_window_left)

    if range_center < 60:
        if(range_left > range_right) and range_left>70:
            print "go left"
        elif (range_left < range_right) and range_right > 70:
            print "go right"
        else:
            print "go back"
    else:
        print "keep going, your distance:" , range_center



def depth_callback(ros_image):

    bridge = CvBridge()

    depth_image = bridge.imgmsg_to_cv2(ros_image)

    depth_array = np.array(depth_image, dtype=np.float32)

    navigation_decision(depth_array)

    cv2.imshow("Depth Image", depth_array)

    cv2.waitKey(0)


rospy.init_node("cv_bridge_demo")


depth_sub = rospy.Subscriber("/camera/depth/image", Image, depth_callback)

rospy.spin()










