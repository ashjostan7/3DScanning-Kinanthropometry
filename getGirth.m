function dist=getGirth(section,polygonsCellMembrane,parallelTo)    
    %CONVEX HULL  
    %Array to save all the girth values  
    distance=[];
    %Loop that runs through all the section from the region - length((polygonsCellMembrane) 
    for i=(1:length(polygonsCellMembrane))
        
        %Get the i'th section
        p=polygonsCellMembrane{i};
        %get the (x,y,z) coordinates of all the points in i'th section
        x=p(:,1);y=p(:,2);z=p(:,3);
        %Convex hull (k) - returns all the indices that belong to the conves
        %hull from all coordinates list. 
        if parallelTo=="xy"
            k=convhull(x,y);
        elseif parallelTo=="yz"
            k=convhull(y,z);
        elseif parallelTo=="xz"
            k=convhull(x,z);
        end

        %Getting the girth of the i'th section using only the k coordinates
        %belonging to the convex hull
        points=[p(k,1),p(k,2),p(k,3)];
        distance=[distance; euclideanDistance(points)];  
    end
    
 %calculating the final girth:
    if section=="waist"
        %Min of girths for waist
        [dist,index]=min(distance);
    elseif section=="calf"
        %Max of girths for calf
        [dist,index]=max(distance);
    end


%PLOTTING THE SECTIONS:
%p- getting the section that had the smallest/greatest

    for i=(1:length(polygonsCellMembrane))
        p=polygonsCellMembrane{i};
        x=p(:,1);y=p(:,2);z=p(:,3);
        if parallelTo=="xy"
            k=convhull(x,y);
        elseif parallelTo=="yz"
            k=convhull(y,z);
        elseif parallelTo=="xz"
            k=convhull(x,z);
        end
        % Plotting the right girth in darker width for 
        if i==index
            plot3(p(:,1),p(:,2),p(:,3),'-','lineWidth',3)
            hold on
            subplot(1,2,2)
            plot3(p(k,1),p(k,2),p(k,3)) 
            hold on
        else
            plot3(p(:,1),p(:,2),p(:,3),'-')
            hold on
            subplot(1,2,2)
            plot3(p(k,1),p(k,2),p(k,3))
            hold on
        end
    end
end
