nearestNeighbor = [];
centroidTesting = [];

for i = 1:height(centroids)
    for j = 1:height(testingCases)
        % use Euclidean distance to find the nearest centroid
        nearestNeighbor = [nearestNeighbor, norm(centroids(i, :) - ...
            testingCases(j, :))]; % row
    end
    % append each row to matrix
    centroidTesting = [centroidTesting; nearestNeighbor];
    nearestNeighbor = []; % clear current row for the next row of entries
end

correct = 0;
incorrect = 0;

for i = 1:width(centroidTesting) % loop through matrix of centroids
    % set initial minimum value for later comparison
    minimum = centroidTesting(1, i);
    index = 1;
    for j = 1:height(centroidTesting)
        if centroidTesting(j, i) < minimum % find minimum value
            minimum = centroidTesting(j, i);
            index = j; % find index at minimum value
        end
    end
    % check if testing data matches centroids from training data
    if centroid_labels(index) == testing.DIVISION(i)
        correct = correct + 1;
    else
        incorrect = incorrect + 1;
    end
end

% calculate accuracy by dividing # correct by total #
accuracy = correct / (correct + incorrect);
disp("Accuracy: " + round(accuracy * 100 * 100) / 100 + "%");

% output file containg centroids and centroid_labels
save("competition.mat", "centroids", "centroid_labels");