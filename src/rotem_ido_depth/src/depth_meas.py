#! /usr/bin/env python

import rospy
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

from rospy.numpy_msg import numpy_msg

from sensor_msgs.msg import Image

def callback(msg):
  print "help"
  plt.imshow(msg.data)
  plt.show()
  print "help1"
'''
  print "IM HERE 2!"
  for y in range(msg.height):
    for x in range (msg.width):
      print ord(msg.data[x][y])
  print "IM HERE 3!"
'''

rospy.init_node('depth_cam2_node')
sub = rospy.Subscriber('/camera/depth/image', numpy_msg(Image), callback)

'''
std_msgs/Header header
  uint32 seq
  time stamp
  string frame_id
uint32 height
uint32 width
string encoding
uint8 is_bigendian
uint32 step
uint8[] data

'''
