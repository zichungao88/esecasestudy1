load('COVIDbyCounty.mat');
[labels, centroids] = kmeans(dates', 5);