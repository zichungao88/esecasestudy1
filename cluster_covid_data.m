load('COVIDbyCounty.mat');
[labels, centroids] = kmeans(CNTY_COVID, 9); % 9 divisions
CNTY_CENSUS_SORTED = sortrows(CNTY_CENSUS, 3); % sort by division

training = []; % 80% of all data
testing = []; % 20% of all data

for i = 1:9
    for j = 1:25
        if j <= 20
            % append to |training|;
        else
            % append to |testing|;
        end
    end
end