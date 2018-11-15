%function calculates center of space
function centerOfSpace = centerOfSpace(network)
    sumX = 0; %sets initial values
    sumY = 0;
    for P = 1:length(network.pnts) %takes network of points and iterates through 
        sumX = sumX + network.pnts(P).loca(1); %adds up the x values of the points
        sumY = sumY + network.pnts(P).loca(2); %adds up the y values of the points
        avgX = 1:length(network.pnts(P)); %not sure why I did this 
        avgY = 1:length(network.pnts(P));
    end
    centerOfSpace = [sumX/avgX sumY/avgY];
end
