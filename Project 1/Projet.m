clc;clear all;close all;
%       1c    2c    5c    10c  20c   50c    1E    E2
%DREF=[16.25 18.75 21.25 19.75 22.25 24.25 23.25 25.75];
f = imread('../Shared_Dataset/1cents_head_1.jpg'); % problema moeda 20 e 1 euro      problema seg 23
%figure(1);imshow(f,[]),title('Image Original'); %f1 - Image original
%h = imfilter(f, fspecial('average', 5));
%figure(15),imshow(h)
% Gold=[179 140 69]; %idx 1 mydataset
% Silver=[155 130 97]; %idx 2 mydataset
% Copper=[205 138 84]; %idx 3 mydataset
% SF=0.044;% SF mydataset
SF=0.0023; % SF Shareddataset
Gold=[100 90 61]; %idx 1 Shareddataset
Silver=[120 112 103]; %idx 2 Shareddataset
Copper=[94 67 58]; %idx 3 Shareddataset
IF=seghsv(f);
T=rgb2hsv(f);
FT=T(:,:,2);
%figure(2);imshow(FT,[]),title('Image channed');
%G=im2bw(FT,graythresh(FT));
G=tse_imthreshold(FT,2,'entropy');
G(G>1)=1;
%figure(3);imshow(G,[]),title('Binary Segmentation')
% f_bw = imcomplement(G);
%
f_bw = imclose(G,strel('disk',10));
% figure(4);imshow(f_bw);
 f_bw3 = imfill(f_bw,'holes');
% figure(5);imshow(f_bw3);
 f_bw5=imclearborder(f_bw3);
 f_bw5= imopen(f_bw5,strel('disk',10));
 f_bw5= bwareaopen(f_bw5,5000);
 
% figure(4);imshow(double(f_bw5).*double(rgb2gray(img)),[]);
 f_label = bwlabel(f_bw5);
 %figure(7);imshow(f_label,[]);%f10
 
% figure(8);imshow(label2rgb(f_label),[]);%f11
 IF=f_label;
%IF=segrgb(f,3);
stats = regionprops(IF,'EquivDiameter','Centroid','PixelList');
n=size(stats,1);% number of coins detected
% figure;imshow(imgO,[]); hold on;
for i=1:n
    coinPxl = stats(i).PixelList;
    St(i)=stats(i).EquivDiameter;
    f_c(i,:) = median(impixel(f,coinPxl(:,1),coinPxl(:,2)));% Calcule of point that represent the coin
end
hold off;

S=St.*SF;
C=f_c;
%       1c    2c    5c    10c  20c   50c    1E    E2
DREF=[16.25 18.75 21.25 19.75 22.25 24.25 23.25 25.75];
CC=zeros(size(DREF));
hold on
 for i=1:n
    DifMM(i,:)=abs(S(i)-DREF); %the absolute diference of the coin analyse and reference value
    DifINDEX(i)=find(DifMM(i,:)==min(DifMM(i,:)));%Find the better correspondence of distance
    DC(i,1)=sqrt((C(i,1)-Gold(1)).^2+(C(i,3)-Gold(3)).^2);
    DC(i,2)=sqrt((C(i,1)-Silver(1)).^2+(C(i,3)-Silver(3)).^2);
    DC(i,3)=sqrt((C(i,1)-Copper(1)).^2+(C(i,3)-Copper(3)).^2);
    Difcollor(i)=find(DC(i,:)==min(DC(i,:)));%Find the better correspondence of color
 end
%%%%%%%%%%%%%%%%%%%Recongnize distance color%%%%%%%%%%%%%%%%%%%
[NomC CC]=recdistcolor(DifINDEX,Difcollor,n,CC);
%%%%%%%%%%%%%%%%%%%Recongnize color distance%%%%%%%%%%%%%%%%%%%
%[NomC CC]=reccolordist(DifINDEX,Difcollor,n,CC);

value=CC(1)+2*CC(2)+5*CC(3)+10*CC(4)+20*CC(5)+50*CC(6)+100*CC(7)+200*CC(8); 
end
 figure(1);imshow(f,[]),title('Image Original'); %f1 - Image original
 hold on
 for i=1:n
     viscircles([S(i).Centroid(1) S(i).Centroid(2)],S(i).EquivDiameter/2);
     text(S(i).Centroid(1),S(i).Centroid(2),NomC(i,:));
 end
    format bank
    value=value/100;
    
 
    