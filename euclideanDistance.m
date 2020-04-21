%Function to calculate girth of each section passed. - sum of distances between
%points in the array of the section
function dist = euclideanDistance(pop)
    dist=0;
    %Euclidean Distance to calculate the girth.
    for i=1:(length(pop(:,1))-1)
        x=pop(i,1);x1=pop(i+1,1);
        y=pop(i,2);y1=pop(i+1,2);
        z=pop(i,3); z1=pop(i+1,3);
        dist=dist+sqrt((x1-x)^2 + (y1-y)^2 + (z1-z)^2);
    end
end