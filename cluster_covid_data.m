load('COVIDbyCounty.mat');
CNTY_CENSUS_SORTED = sortrows(CNTY_CENSUS, 3);

training = []; % 75% of all data
testing = []; % 25% of all data
trainingCases = [];
testingCases = [];

for i = 1:(length(CNTY_CENSUS_SORTED.fips)) % 3-1 ratio
    if mod(i, 4) == 0
        testing = [testing; CNTY_CENSUS_SORTED(i, :)];
    else
        training = [training; CNTY_CENSUS_SORTED(i, :)];
    end
end

for i = 1:height(training) % index from CNTY_COVID (original raw data)
    trainingCases = [trainingCases; CNTY_COVID(CNTY_CENSUS.fips == ...
        training(i, :).fips, :)];
end

for i = 1:height(testing)
    testingCases = [testingCases; CNTY_COVID(CNTY_CENSUS.fips == ...
        testing(i, :).fips, :)];
end

k = 25; % subject to change
% apply k-means algorithm on training group
[indices, centroids] = kmeans(trainingCases, k, 'Replicates', 10);

centroidDivision = [];
centroidTraining = [];

for i = 1:k % loop through the k centroids
    for j = 1:height(indices)
        if indices(j) == i
            centroidDivision = [centroidDivision, training.DIVISION(j)];
        end
    end
    % determine the most frequent division in each centroid in order to
    % determine which division said centroid belongs to
    centroidTraining = [centroidTraining; mode(centroidDivision)];
    centroidDivision = [];
end