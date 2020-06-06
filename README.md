# 3DScanning-Kinanthropometry
Extracting calf and waist girth from 3 dimensional reconstructed human scans

![alt text](https://github.com/ashjostan7/3DScanning-Kinanthropometry/blob/master/anthropometric_measurements.png)


The repository consists of the following files/folders:
  - driverScript.m: Only script needed to be modified to run the code for current application. Give necessary inputs inside
  
  - xcmesh.m: Code to get the contour across a plane from a 3D model. https://github.com/brhannan/xsecmesh
  
  - read_plot_stl.m: Use this file to view the .stl and see which axis planes the planes need to be parallel with and decide on the lower and upper bound
  
  - getSections.m- used to define the planes and get the contours across the planes. 
  
  - getGirth.m - Plots and calls the euclidean distance function.
  
  - euclideanDistance.m: Function to get the distance from the given points of the contour.
  
  - stl-tools: Contains all the functions required to work with .stl files for matlab. (Note: ensure to set path for matlab to all subfolders when running the scripts.)

NOTE: The 3D scans provided(.stl files) are the scans of the author.


