#!/usr/bin/env python


import rospy
from of_avihay_ronly_pkg.msg import cordinate
import cv2
import globalVariables as gV
import numpy as np
import random
import time

def findDistance(r1, c1, r2, c2):
    d = (r1 - r2) ** 2 + (c1 - c2) ** 2
    d = d ** 0.5
    return d
def opticalflow(old_corners, oldFrameGray):
    count=0
    corner=0
    while True:
        'Now we have oldFrame,we can get new_frame,we have old corners and we can get new corners and update accordingly'

        # read new frame and cvt to gray
        ret, frame = cap.read()
        frameGray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        # finding the new tracked points
        new_corners, st, err = cv2.calcOpticalFlowPyrLK(oldFrameGray, frameGray, old_corners, None, **lk_params)

        """
        flow = cv2.calcOpticalFlowFarneback(oldFrameGray, frameGray, float(0), float(0), 3, 15, 3, 5, float(1), 0)
        #cv2.imshow('flow', draw_flow(gray, flow))
        i=0
        new=np.ndarray(shape=(len(kp),1,2),dtype=float,order='F')
        for c in old_corners:
            new[i][0][0]=c[0][0]+round((flow[int(c[0][0])][int(c[0][1])][0]))
            new[i][0][1] = c[0][1] + round((flow[int(c[0][0])][int(c[0][1])][1]))
            i=i+1
        new=np.float32(new)
        """
        # ---pruning far away points:
        # first finding centroid
        r_add, c_add = 0, 0
        """
        for corner in new:
            r_add = r_add + corner[0][1]
            c_add = c_add + corner[0][0]
        centroid_row = int(1.0 * r_add / len(new))
        centroid_col = int(1.0 * c_add / len(new))
        """

        for corner in new_corners:
            r_add = r_add + corner[0][1]
            c_add = c_add + corner[0][0]
        centroid_row = int(1.0 * r_add / len(new_corners))
        centroid_col = int(1.0 * c_add / len(new_corners))

        # draw centroid
        cv2.circle(frame, (int(centroid_col), int(centroid_row)), 5, (255, 0, 0))
        # add only those corners to new_corners_updated which are at a distance of 30 or esse
        """
        new_corners_updated = new.copy()#new
        """

        new_corners_updated = new_corners.copy()

        #  cv2.waitKey(0)
        tobedel = []
        """
        for index in range(len(new)):
            if findDistance(new[index][0][1], new[index][0][0], int(centroid_row),
                            int(centroid_col)) > 100:
                tobedel.append(index)
        new_corners_updated = np.delete(new_corners_updated, tobedel, 0)
        """

        for index in range(len(new_corners)):
            if findDistance(new_corners[index][0][1], new_corners[index][0][0], int(centroid_row),
                            int(centroid_col)) > 100:
                tobedel.append(index)
        new_corners_updated = np.delete(new_corners_updated, tobedel, 0)

        # drawing the new points
        for corner in new_corners_updated:
            cv2.circle(frame, (int(corner[0][0]), int(corner[0][1])), 5, (0, 255, 0))
        """
        if len(new_corners_updated) < 5:
            print
            'OBJECT LOST, Reinitialize for tracking'
            break
        """
        # finding the min enclosing circlea
        ctr1, rad1 = cv2.minEnclosingCircle(new_corners_updated)

        cv2.rectangle(frame, (int(ctr1[0]-rad1), int(ctr1[1]-rad1)), (int(ctr1[0]+rad1), int(ctr1[1]+rad1)), color=(0, 0, 255), thickness=5)


        # updating old_corners and oldFrameGray
        oldFrameGray = frameGray.copy()
        old_corners = new_corners_updated.copy()

        # showing stuff on video
        cv2.putText(frame, 'Tracking Integrity : Excellent %04.3f' % random.random(), (20, 50),
                    cv2.FONT_HERSHEY_SIMPLEX, 1, color=(200, 50, 75), thickness=3)
        cv2.imshow('tracker', frame)

        a = cv2.waitKey(5)
        if a == 27:
            cv2.destroyAllWindows()
            cap.release()

        count=count+1
        if count==1000:
            break
	
	cords.x=centroid_col
	cords.y=centroid_row
	print(time.time())
	pub.publish(cords)


    return centroid_col,centroid_row, frame ,rad1




rospy.init_node("cv_of_demo")
pub=rospy.Publisher('/cordiante_info', cordinate, queue_size=1)
cords=cordinate()
gV.selRoi = 0
gV.top_left = [150, 220]
gV.bottom_right = [320, 400]
gV.first_time = 1

# Parameters for lucas kanade optical flow
lk_params = dict(winSize=(15, 15),
                 maxLevel=1,
                 criteria=(cv2.TERM_CRITERIA_EPS | cv2.TERM_CRITERIA_COUNT, 10, 0.03))

cap = cv2.VideoCapture("/dev/video14")
rad=(gV.bottom_right[1]-gV.top_left[1])/2
centroid_col=gV.top_left[1]+rad
centroid_row=gV.top_left[0]+rad
#rospy.spin()
#ctr=[gV.top_left[0]+rad,gV.top_left[1]+rad]
while True:
    _, frame = cap.read()
    # -----Drawing Stuff on the Image
    cv2.putText(frame, 'Press a to start tracking', (20, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, color=(60, 100, 75),
                thickness=3)
    cv2.rectangle(frame, (int(centroid_col-rad), int(centroid_row-rad)), (int(centroid_col+rad), int(centroid_row+rad)),
                  color=(100, 255, 100), thickness=4)
    frameGray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    roi = frameGray[int(centroid_row - rad):int(centroid_row + rad),int(centroid_col - rad):int(centroid_col + rad)]  # selecting roi
    fast = cv2.FastFeatureDetector_create()
    kp = fast.detect(roi, None)

    """"""
    #new_corners1 = cv2.goodFeaturesToTrack(roi, 320, 0.2, 6)  # find corners

    # -----converting to complete image coordinates (new_corners)

    #new_corners1[:, 0, 0] = new_corners1[:, 0, 0] + gV.top_left[1]
    #new_corners1[:, 0, 1] = new_corners1[:, 0, 1] + gV.top_left[0]
    i = 0
    # -----drawing the corners in the original image


    new_corners = np.ndarray(shape=(len(kp), 1, 2), dtype=float, order='F')

    for corner in kp:
        cv2.circle(frame, (int(corner.pt[0] + gV.top_left[1]), int(corner.pt[1] + gV.top_left[0])), 5, (0, 255, 0))
        new_corners[i][0][0] = corner.pt[0] + gV.top_left[1]
        new_corners[i][0][1] = corner.pt[1] + gV.top_left[0]
        i = i + 1
    new_corners = np.float32(new_corners)
    # -----old_corners and oldFrame is updated

    oldFrameGray = frameGray.copy()
    old_corners = new_corners.copy()

    cv2.imshow('tracker', frame)
    # a=cv2.waitKey(3000)
    a = cv2.waitKey(5)
    if a == 27:
        cv2.destroyAllWindows()
        cap.release()

    if a==97:
        break

while True:
    centroid_col, centroid_row, frame ,rad= opticalflow(old_corners, oldFrameGray)
	

    # -----Finding ROI and extracting Corners
    frameGray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    roi = frameGray[int(centroid_row-rad-5):int(centroid_row+rad+5), int(centroid_col-rad-5):int(centroid_col+rad+5)]  # selecting roi
    fast = cv2.FastFeatureDetector_create()
    kp = fast.detect(roi, None)

   # new_corners1 = cv2.goodFeaturesToTrack(roi, 320, 0.2, 6)  # find corners

    # -----converting to complete image coordinates (new_corners)

#    new_corners1[:, 0, 0] = new_corners1[:, 0, 0] + gV.top_left[1]
#  new_corners1[:, 0, 1] = new_corners1[:, 0, 1] + gV.top_left[0]
    i=0
     # -----drawing the corners in the original image


    new_corners=np.ndarray(shape=(len(kp),1,2),dtype=float,order='F')

    for corner in kp:

        cv2.circle(frame, (int(corner.pt[0]+centroid_col-rad), int(corner.pt[1]+centroid_row-rad)), 5, (0, 255, 0))
        new_corners[i][0][0]= corner.pt[0]+centroid_col-rad
        new_corners[i][0][1] = corner.pt[1]+centroid_row-rad
        i=i+1
    new_corners=np.float32(new_corners)
    # -----old_corners and oldFrame is updated

    oldFrameGray = frameGray.copy()
    old_corners = new_corners.copy()


    cv2.imshow('tracker', frame)
    # a=cv2.waitKey(3000)
    a = cv2.waitKey(5)
    if a == 27:
        cv2.destroyAllWindows()
        cap.release()
    # ----Actual Tracking-----


#cv2.destroyAllWindows()

rospy.spin()
