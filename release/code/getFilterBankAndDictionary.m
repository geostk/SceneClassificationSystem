function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

    filterBank  = createFilterBank();

    % TODO Implement your code here
    a = 150;
    K = 250;
    x=1:a;
    filterOut = zeros(size(imPaths,2)*a, 3*size(filterBank,1));
    for i = 1:length(imPaths)
        im = imread(char(imPaths(i)));
        imgA = zeros(a,3*size(filterBank,1));
        in1 = [1:a];
        pCount = randperm(size(im,1)*size(im,2),a);
        filterOut1 = extractFilterResponses(im, filterBank);
        filterOut1 = reshape(filterOut1,[size(filterOut1,1)*size(filterOut1,2),3*size(filterBank,1)]);
      %  [kl1,kl2] = ind2sub([size(filterOut1,1) size(filterOut1,2)],pCount);
        imgA(in1,:) = filterOut1(pCount,:);
      %  filterOut(x,:)= reshape(filterOut1,[size(filterOut1,1)*size(filterOut1,2),3*size(filterBank,1)]);
        filterOut(x,:) = imgA;
        x = x(a)+1:x(a)+a;
    end
    [~, dictionary] = kmeans(filterOut, K, 'EmptyAction','drop');
    dictionary = transpose(dictionary);
end
