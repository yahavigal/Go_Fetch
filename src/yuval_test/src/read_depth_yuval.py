#!/usr/bin/env python

import rospy

import cv2

from sensor_msgs.msg import Image

from cv_bridge import CvBridge

import numpy as np


def manage_nan_and_zeros(mat):

    mat_nan_to_zeros = np.nan_to_num(mat)

    mat_nan_to_zeros[mat_nan_to_zeros == 0] = float("inf")

    mat_no_nan_zero_to_inf = mat_nan_to_zeros

    return mat_no_nan_zero_to_inf


def navigation_decision(depth_array):

    [width, height] = depth_array.shape

    # forward window edges
    y_upper_edge_center = int(0.25 * height)
    y_lower_edge_center = int(0.75 * height)
    x_left_edge_center = int(0.25 * width)
    x_right_edge_center = int(0.75 * width)

    # left window edges
    y_upper_edge_left = int(0.25 * height)
    y_lower_edge_left = int(0.75 * height)
    x_left_edge_left = int(0 * width)
    x_right_edge_left = int(0.25 * width)

    # right window edges
    y_upper_edge_right = int(0.25 * height)
    y_lower_edge_right = int(0.75 * height)
    x_left_edge_right = int(0.75 * width)
    x_right_edge_right = int(1 * width)

    left_window = depth_array[y_upper_edge_left:y_lower_edge_left,x_left_edge_left:x_right_edge_left]
    center_window = depth_array[y_upper_edge_left:y_lower_edge_left, x_left_edge_center:x_right_edge_center]
    right_window = depth_array[y_upper_edge_left:y_lower_edge_left, x_left_edge_right:x_right_edge_right]

    min_in_window_left = np.min(manage_nan_and_zeros(left_window)) * 100
    min_in_window_center = np.min(manage_nan_and_zeros(center_window)) * 100
    min_in_window_right = np.min(manage_nan_and_zeros(right_window)) * 100

    dist_tresh = 60

    if min_in_window_center < dist_tresh:

        if min_in_window_left < dist_tresh and min_in_window_right < dist_tresh:
            print "STOP"

        if min_in_window_left < dist_tresh and min_in_window_right > dist_tresh:
            print "Go right"

        if min_in_window_left > dist_tresh and min_in_window_right < dist_tresh:
            print "Go left"

        if min_in_window_left > dist_tresh and min_in_window_right > dist_tresh:
            if min_in_window_left > min_in_window_right:
                left_is_better = 1
            else: left_is_better = 0

            if left_is_better:
                print "Go left"
            else: print "Go right"

    else: print "Go forward"


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










