function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('data/traintest.mat');
    train_features = [];
  %  train_labels = [];
	% TODO create train_features
    for ftr = 1 : length(train_imagenames)
        wordMapI = load(strrep(strcat('data/',train_imagenames{ftr}),'.jpg','.mat'))
        L = 2;
        [h] = getImageFeaturesSPM(L + 1, struct2array(wordMapI), size(dictionary,2));
        h = transpose(h);
        train_features = [train_features h];
      %  train_labels{ftr} = mapping{};
    end
	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end