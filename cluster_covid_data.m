load('COVIDbyCounty.mat');

training = []; % 75% of all data
testing = []; % 25% of all data

for i = 1:(length(CNTY_CENSUS_SORTED.fips)) % 3-1 ratio
    if mod(i, 4) == 0
        testing = [testing; CNTY_CENSUS_SORTED(i, :)];
    else
        training = [training; CNTY_CENSUS_SORTED(i, :)];
    end
end

k = 9; % subject to change
[labels, centroids] = kmeans(CNTY_COVID, k);
CNTY_CENSUS_SORTED = sortrows(CNTY_CENSUS, 3);
