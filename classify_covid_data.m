nearestNeighbor = [];
centroidAssignment = [];

for i = 1:width(centroids)
    for j = 1:height(centroids)
        nearestNeighbor = [nearestNeighbor; norm(testingCases(i, :) - ...
            centroids(j, :))];
    end
    centroidAssignment = [centroidAssignment; min(nearestNeighbor)];
    nearestNeighbor = [];
end