function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
    wordMap = zeros(size(img,1), size(img,2)); 
    filterResponses = extractFilterResponses(img, filterBank);
    filterResponses = reshape(filterResponses, size(img,1)* size(img,2), 3*length(filterBank));
    dictionary = transpose(dictionary);
    distances = pdist2(filterResponses,dictionary);
    %distances = reshape(distances,size(img,1),size(img,2),size(dictionary,1));
    [~,wordMap] = min(distances,[],2);
    wordMap = reshape(wordMap,size(img,1), size(img,2)); 
end
