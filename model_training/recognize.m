function [speculateAnswer]= recognize(filename)

%Load image
image=imread(filename);
image=im2double(image);

%Convert color to grayscale
redChannel=image(:,:,1);
greenChannel=image(:,:,2);
blueChannel=image(:,:,3);
grayScaleMap=[0.2989,0.5870,0.1140];
imgGray=grayScaleMap(1)*redChannel+...
    grayScaleMap(2)*greenChannel+...
    grayScaleMap(3)*blueChannel;

%Convert grayscale to monochrome
imgMono=(imgGray<=(0.71));
clear image redChannel greenChannel blueChannel imgGray grayScaleMap

%Cut words with stupid method
hSum=sum(imgMono,1)>0;
hRecord=zeros(1,1);
hR_index=1;
charCount=0;
for i=1:size(hSum,2)-1
    if(hSum(i))&&(mod(hR_index,2)~=0)
        hRecord(hR_index)=i;
        hR_index=hR_index+1;
        charCount=charCount+1;
    elseif(~hSum(i))&&(mod(hR_index,2)==0)
        hRecord(hR_index)=i;
        hR_index=hR_index+1;
    end
end
clear hR_index hSum

vRecord=zeros(charCount,2);
for i=1:charCount
    vSum=sum(imgMono(:,(hRecord(2*i-1):hRecord(2*i))),2);
    
    % search from the top
    for j=1:size(vSum,1)
        if(vSum(j))
            vRecord(i,1)=j;
            break
        end
    end
    
    % search from the bottom
    for j=size(vSum,1):-1:1
        if(vSum(j))
            vRecord(i,2)=j;
            break
        end
    end
end
clear vSum i j

% Get separated words
words = cell(1,charCount);
for i=1:charCount
    vRange=vRecord(i,1)-1:vRecord(i,2);
    hRange=hRecord(2*i-1):hRecord(2*i);
    imgCut=imgMono(vRange,hRange);
    imgCutCut=zeros(25,20);
    imgCutCut(1:min(size(imgCut,1),25),1:min(size(imgCut,2),20))=imgCut(1:min(size(imgCut,1),25),1:min(size(imgCut,2),20));
    words{i}=imgCutCut;
end

reshapedWords=cell(1,charCount);
speculateResult=cell(1,charCount);
for i=1:charCount
    reshapedWords{i}=reshape(words{i}',[1,500]);
    speculateResult{i}=speculate(reshapedWords{i});
end
% 00000000000000000000000011100100000000000011111111000000000001110000110000000000011000001100000000001100000011000000000011000000110000000000110000011100000000001100000110000000000011100011100000000000011111011000000000000011100110000000000000000011000000000000000000110000000000001100111000000000000011111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
% 
% compared!
% 
% 00000000000000000000000011100100000000000011111111000000000001110000110000000000011000001100000000001100000011000000000011000000110000000000110000011100000000001100000110000000000011100011100000000000011111011000000000000011100110000000000000000011000000000000000000110000000000001100111000000000000011111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

speculateAnswers=cell(1,charCount);
for i=1:charCount
    [~,index]=max(speculateResult{i});
    speculateAnswers{i}=char(index+'a'-1);
end
speculateAnswer=strjoin(speculateAnswers,'');

end