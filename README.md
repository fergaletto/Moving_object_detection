# Moving Object Detection. 

In this code we implemented a simple moving object detector using MATLAB. The method consists performing these 3 simple steps: 

<ol>
<li>Background estimation. </li>
<li>Calculate the difference between the current frame and the background. </li>
<li>Divide the frame into patches and calculate the standard deviation of each patch. </li>
<li>Estimate the global image threshold T using Otsu's method. </li>
<li>Binarize the image obtained in step 3 using the threshold obtained in step 4. </li>
<li>Draw the bounding boxes. </li>
</ol> 

The bounding boxes can be filtered by size using the varible _min_size_. 

The size of the patches is selected using the variable _wsize_. 

![Alt Text](https://github.com/fergaletto/Moving_object_detection/blob/main/object%20detection.gif)

**NOTE:** The camera must remain as steady as possible for this method to be successful.
