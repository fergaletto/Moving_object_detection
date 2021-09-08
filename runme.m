% This matlab code performs a simple method for moving object detection. 
% The camera is considered to remain still during the video capture. 
% Written by Fernando J. Galetto
close all
clear all 

% beginning.
filename= 'highway.avi';
startTime = 0; % number of seconds before start processing the video. 
sensibilty = 0.01; % sensibility number, select 0.05 for more sensibility. 
min_size = 20; % THe smallest bounding box displayed will be 20x20
wsize = 5; % patch size to detect the change between frames. 


vidObj = VideoReader(filename);
vidObj.CurrentTime = startTime;

fun = @(x) std(x.data(:)); % function for the blocproc

% initialize the background. 
back = 0
for i = 1 : 200
    back = back + rgb2gray(double(readFrame(vidObj))/255)/200;
end 

% Read video frames until available
while hasFrame(vidObj)
    tic
    % Read the frame

    Frame = (((double(readFrame(vidObj))/255)));

    vidFrame = rgb2gray(Frame);
 
    % calculate the difference between the frame and background. 
    dif=((vidFrame-back).^2);
    
    % find the patches std to see where the changes are. 
    
    det = blockproc(dif,[wsize wsize],fun);  
    result = (imresize((det), wsize, 'nearest' ));

        % Display the result 



     
    %plot bouding boxes
    T = graythresh(result); % find a threshold to binarize the std map
    T = imbinarize(result,max(T, sensibilty)); % binarize the std map
    
    %Background estimation for next frame.  
    %back = (100*back+(vidFrame.*(1-T)+back.*T))/101;
    %back = (100*back+vidFrame)/101;
    back = back + 1/500.*(vidFrame-back);
    figure(1)
    imshow([vidFrame]);
    st = regionprops(T, 'BoundingBox' );

    hold on     
    for k = 1 : length(st)
        box= st(k).BoundingBox;
        % Filter small boxes. 
        if (box(3) > min_size) & (box(4)> min_size)
            rectangle('Position', [box(1), box(2), box(3), box(4)],...
            'EdgeColor','g','LineWidth',1 )
        end
    end
    hold off
    disp([num2str(ceil(1/toc)) ' FPS'])
end

