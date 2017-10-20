function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('data/traintest.mat');

	% TODO Implement your code here
    C = zeros(8,8);
    for j = 1 : length(test_imagenames)
            g = guessImage(strcat('data\',test_imagenames{j}));
            k = extractBefore(test_imagenames{j},"/");
            ind1 = find(contains(mapping, k));
            ind2 = find(contains(mapping, g));
            C(ind1,ind2) = C(ind1, ind2) + 1;
    end   
    save('saveC.mat','C');
    conf = trace(C)/sum(C(:));
    
end