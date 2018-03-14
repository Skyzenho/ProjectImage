function [imgseg]=seghsv(img);
%imgseg=seghsv(img)
%This function do segmentation with one channel selected from HSV Space.
%HSV space color represent image in hue,saturation,value.
%Input---
%img: Image to segmentate
%Output---
%imgseg: Final image segmentate and "labeled"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=rgb2hsv(img);% Convert RGB Space color to HSV
FT=T(:,:,2); % Select Saturation Channel 
G=tse_imthreshold(FT,2,'entropy'); %Realize Threshold
G(G>1)=1;
f_bw = imclose(G,strel('disk',20)); 
f_bw3 = imfill(f_bw,'holes');
f_bw5=imclearborder(f_bw3);
f_bw5= imopen(f_bw5,strel('disk',10));
f_bw5= bwareaopen(f_bw5,5000);
f_label = bwlabel(f_bw5);
imgseg=f_label;
end