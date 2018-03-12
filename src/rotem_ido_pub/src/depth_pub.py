#! /usr/bin/env python

import rospy
from sensor_msgs.msg import Image

rospy.init_node('detph_pub')
pub = rospy.Publisher('/camera/depth/image', Image, queue_size=1)
rate = rospy.Rate(0.5)

while not rospy.is_shutdown(): 
  pub.publish()
  rate.sleep()
