function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here
img = double(img);
if size(img,3) ~= 3
    img = repmat(img,[1,1,3]);
    img(:,:,1) = 1;
end
w = size(img, 1);
h = size(img, 2);
N = size(filterBank);
[L,a,b] = RGB2Lab(img(:,:,1), img(:,:,2), img(:,:,3));
img = cat(3,L,a,b);
filterResponses = zeros (w, h, N(1)*3);
for i=1:N(1)
    k = (i-1)*3;
    filtrdImg = imfilter(img,filterBank{i});
    filterResponses(:,:,k+1) = filtrdImg(:,:,1);
    filterResponses(:,:,k+2) = filtrdImg(:,:,2);
    filterResponses(:,:,k+3) = filtrdImg(:,:,3);
end
%filterResponses = reshape(filterResponses,[size(filterResponses,1), size(filterResponses,2), 3, size(filterResponses,3)/3]);
end
