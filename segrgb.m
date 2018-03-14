function [imgseg]=segrgb(img);
%imgseg=segrgb(img)
%This function do segmentation with one channel selected from RGB Space.
%RGB space color represent image in Red,Green,Blue.
%Input---
%img: Image to segmentate
%Output---
%imgseg: Final image segmentate and "labeled"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FT=img(:,:,3);
G=im2bw(FT,graythresh(FT));
f_bw = imcomplement(G);
f_bw = imclose(f_bw,strel('disk',10));
f_bw = imfill(f_bw,'holes');
f_bw5= imopen(f_bw,strel('disk',20));
f_bw5= bwareaopen(f_bw5,5000);
f_bw5=imclearborder(f_bw5);
f_label = bwlabel(f_bw5);
imgseg=f_label;
end