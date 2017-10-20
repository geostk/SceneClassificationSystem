function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
    
 %   layer1 = layerNum - 1;
   % hist1 = cell(4*layer1*layer1);
  %  l1 = size(wordMap,1)/(2*layer1);
   % l2 = size(wordMap,2)/(2*layer1);
    %cells1 = (l1)*ones(1,2*layer1);
%    cells2 = (l2)*ones(1,2*layer1);
 %   imgLayer1Array = mat2cell(wordMap,cells1,cells2);
  %  hist1 = [];
   % hist1 = zeros(dictionarySize,numel(imgLayer1Array));
  %  for i = 1 : numel(imgLayer1Array)
   %     matValue = cell2mat(imgLayer1Array(i));
     %   hist1(:,i) = getImageFeatures(matValue,dictionarySize);
 %    hist1 = getImageFeatures(matValue,dictionarySize);
    % hist1 = [hist1  getImageFeatures(matValue,dictionarySize)];
   % end
    
    % next layer
    % layer1 = layerNum - 2;
   % hist1 = cell(4*layer1*layer1);
   % l1 = size(wordMap,1)/(2*layer1);
   % l2 = size(wordMap,2)/(2*layer1);
   % cells1 = (l1)*ones(1,2*layer1);
   % cells2 = (l2)*ones(1,2*layer1);
   % imgLayer1Array = mat2cell(wordMap,cells1,cells2);
  %  hist2 = [];
   % hist1 = zeros(dictionarySize,numel(imgLayer1Array));
    %for i = 1 : numel(imgLayer1Array)
     %   matValue = cell2mat(imgLayer1Array(i));
     %   hist1(:,i) = getImageFeatures(matValue,dictionarySize);
 %    hist1 = getImageFeatures(matValue,dictionarySize);
    % hist2 = [hist2  getImageFeatures(matValue,dictionarySize)];
   % end
    
   histTotal = [];
       wt = 1;
    for j = layerNum:-1:1
    % next layer
     layer1 = j - 1;
     if (layer1 ~= 0)
   % hist1 = cell(4*layer1*layer1);
    wt = wt/2; 
    l1 = floor(size(wordMap,1)/(2*layer1));
    l2 = floor(size(wordMap,2)/(2*layer1));
    cells1 = (l1)*ones(1,2*layer1);
    cells2 = (l2)*ones(1,2*layer1);
    diff = size(wordMap,1) - sum(cells1);
    cells1(1) = cells1(1) + diff;
    diff2 = size(wordMap,2) - sum(cells2);
    cells2(1) = cells2(2) + diff2;
    imgLayer1Array = mat2cell(wordMap,cells1,cells2);
    hist1 = [];
   % hist1 = zeros(dictionarySize,numel(imgLayer1Array));
    for i = 1 : numel(imgLayer1Array)
        matValue = cell2mat(imgLayer1Array(i));
     %   hist1(:,i) = getImageFeatures(matValue,dictionarySize);
 %    hist1 = getImageFeatures(matValue,dictionarySize);
     hist1 = [hist1  getImageFeatures(matValue,dictionarySize)];
    end
    histTotal = [histTotal  hist1.*wt];
     else
         hist1 = getImageFeatures(wordMap,dictionarySize);
         histTotal = [histTotal  hist1.*wt];
     end
     
    end
%histTotal = [hist1./2  hist2./4  hist3./4];
h = histTotal./sum(hist1(:));
histogram(h);
end