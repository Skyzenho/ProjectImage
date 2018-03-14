function [stats,CC,NomC,value]=classification(imgO,imgL,SF,Copper,Silver,Gold);
%[stats,CC,NomC,value]=classification(imgO,imgL,SF,Copper,Silver,Gold);
%This function do segmentation with auxiliaire image to analize RGB area.
%Input---
%imgO: Image to classificate
%imgL: Image avec labels
%SF:    Scale Factor
%Copper: Reference RGB coin Copper
%Silver: Reference RGB coin Silver
%Gold: Reference RGB coin Gold
%Output---
%%%%%%S: Size of coin
%CC: Fréquences de sizes
%NomC: Name of coin reconized
%stats: Position of coins
%Value: total reconized
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stats = regionprops(imgL,'EquivDiameter','Centroid','PixelList');
n=size(stats,1);% number of coins detected
for i=1:n
    coinPxl = stats(i).PixelList;
    St(i)=stats(i).EquivDiameter;
    f_c(i,:) = median(impixel(imgO,coinPxl(:,1),coinPxl(:,2)));% Calcule of point that represent the coin
end
S=St.*SF; %Calcule Distance the coin in mm
C=f_c;
%       1c    2c    5c    10c  20c   50c    1E    E2
DREF=[16.25 18.75 21.25 19.75 22.25 24.25 23.25 25.75];
CC=zeros(size(DREF));
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
 
function [NomC CC]=recdistcolor(DifINDEX,Difcollor,n,CC)
   for i=1:n
    if DifINDEX(i)==1
        if Difcollor(i)==3 %Copper
            CC(1)=CC(1)+1;
            NomC(i,:)='C1   ';
        else
            NomC(i,:)='Error';
        end
    elseif DifINDEX(i)==2
        if Difcollor(i)==3 %Copper
            CC(2)=CC(2)+1;
            NomC(i,:)='C2   ';
        else
            NomC(i,:)='Error';
        end
    elseif DifINDEX(i)==3
        if Difcollor(i)==3 %Copper
            CC(3)=CC(3)+1;
            NomC(i,:)='C5   ';
        else
            NomC(i,:)='Error';
        end
    elseif DifINDEX(i)==4
        if Difcollor(i)==1 %Gold
            CC(4)=CC(4)+1;
            NomC(i,:)='C10  ';
        else
            NomC(i,:)='Error';
        end
    elseif DifINDEX(i)==5
        if Difcollor(i)==1 %Gold
            CC(5)=CC(5)+1;
            NomC(i,:)='C20  ';
        else
            NomC(i,:)='Error';
        end
     elseif DifINDEX(i)==6
         if Difcollor(i)==1 %Gold
            CC(6)=CC(6)+1;
            NomC(i,:)='C50  ';
         else
            NomC(i,:)='Error';
         end
    elseif DifINDEX(i)==8
         if Difcollor(i)==1 %Gold
            CC(8)=CC(8)+1;
            NomC(i,:)='E2   ';
         else
            NomC(i,:)='Error';
         end
    elseif DifINDEX(i)==7
         if Difcollor(i)==2 %Silver
            CC(7)=CC(7)+1;
            NomC(i,:)='E1   ';
         else
            NomC(i,:)='Error';
         end
    end
   end
end


function [NomC CC]=reccolordist(DifINDEX,Difcollor,n,CC)
   for i=1:n
    if Difcollor(i)==3 %Copper
        if DifINDEX(i)==1
            CC(1)=CC(1)+1;
            NomC(i,:)='C1   ';
        elseif DifINDEX(i)==2
            CC(2)=CC(2)+1;
            NomC(i,:)='C2   ';
        elseif DifINDEX(i)==3 
            CC(3)=CC(3)+1;
            NomC(i,:)='C5   ';
        else
        NomC(i,:)='Error';
        end
    elseif Difcollor(i)==2 %Silver
            if DifINDEX(i)==7
            CC(7)=CC(7)+1;
            NomC(i,:)='E1   ';
            else
            NomC(i,:)='Error';
            end
    elseif Difcollor(i)==1 %Gold
        if DifINDEX(i)==4
            CC(4)=CC(4)+1;
            NomC(i,:)='C10  ';
        elseif DifINDEX(i)==5
            CC(5)=CC(5)+1;
            NomC(i,:)='C20  ';
        elseif DifINDEX(i)==6
            CC(6)=CC(6)+1;
            NomC(i,:)='C50  ';
        elseif DifINDEX(i)==8
            CC(8)=CC(8)+1;
            NomC(i,:)='E2   ';
        else
            NomC(i,:)='Error';
        end
    end
   end
end