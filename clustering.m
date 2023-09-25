load('COVIDbyCounty.mat');
[labels, centroids] = kmeans(CNTY_COVID, 10);
% plot(centroids);