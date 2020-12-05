# Moving_object_detection

In this code we implemented a simple moving object detector using MATLAB. The method consists performing these 3 simple steps: 

1- Background estimation. 
2- Calculate the difference between the current frame and the background. 
3- Divide the frame into patches and calculate the standard deviation of each patch. 
4- Estimate the global image threshold T using Otsu's method. 
5- Binarize the image obtained in step 3 using the threshold obtained in step 4. 
6- Draw the bounding boxes. 

The bounding boxes can be filtered by size using the varible min_size. 
The size of the patches is selected using the variable wsize. 

![Alt Text](https://github.com/fergaletto/Moving_object_detection/blob/main/object%20detection.gif)

NOTE: The camera must remain as steady as possible for this method to be successful.
