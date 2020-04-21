function [polygonsCellMembrane]= getSections(fileName,parallelTo,lowerBound,upperBound,numberOfPlanes)
    %Reading the stl file::
    [vertsMembrane,facesMembrane,n,name]  = stlRead(fileName);

    %VertsMembrane are the vertices
    %facesMembrane are the faces
    %n are the normals
    %NAME is the name of the STL object (NOT the name of the STL file)

    %Plotting the stl file::
    stlPlot(vertsMembrane, facesMembrane, name);
    xlabel('X-axis (girth)');
    ylabel('Y-axis');
    zlabel('Z-axis');
    polygonsCellMembrane = cell(1,100);
    planeVals = linspace(lowerBound,upperBound,numberOfPlanes);
    for numPlane = 1:numel(planeVals)
        % Create the points on the plane.
        if parallelTo=="xy"
            planePoints = [0,1,0+planeVals(numPlane),   1,0,0+ planeVals(numPlane),   0,0,0++planeVals(numPlane)];
        elseif parallelTo =="yz"
            planePoints = [0+planeVals(numPlane),0,0,   0+planeVals(numPlane),1, 0,   0+planeVals(numPlane),0,1];
        elseif parallelTo =="xz"
            planePoints = [0,0+planeVals(numPlane),1,   0,0+planeVals(numPlane),0,    1,0+planeVals(numPlane),0];
        end
         %Creating the plane:  
         plane = [ planePoints(1:3),planePoints(4:6)-planePoints(1:3),planePoints(7:9)-planePoints(1:3)];   
         %Getting the sections from the plane:
         polyCellNow = xsecmesh(plane, vertsMembrane, facesMembrane);
         % Store the results.
         if ~isempty(polyCellNow)
             % Find the first un-used cell array element.
             firstIx = find(cellfun(@isempty,polygonsCellMembrane),1);
             % Store the polygons.
             polygonsCellMembrane(firstIx:firstIx+numel(polyCellNow)-1) = polyCellNow;
        end
    end
    % Remove the empty cells.
    polygonsCellMembrane = polygonsCellMembrane(~cellfun(@isempty,polygonsCellMembrane));
      
end

