%Inputs to run the code:

    % % % %1. File name - Path to the .stl file
    fileName='E:\Univeristy Modules\Applied Measurements\stl-files-waist\se001_mesh-1-waist.stl';
    
    % % % %2. Section - Choose between "calf" and "waist"
    section="waist";%"calf" OR "waist";
    
    % % % %parallelTo- mention the axis planes the planes need being created need
    % % % % to be parallel to - Options: "xy" , "yz" , "xz"
    parallelTo="yz";
    
    % % % % lowerBound,upperBound: mention the lower and upper range between
    % % % % which the planes need to be created.
    % % % % if your planes need to be parallel to xy your bounds will be on the 'z-axis'
    % % % % if your planes need to be parallel to yz your bounds will be on the 'x-axis'
    % % % % if your planes need to be parallel to xz your bounds will be on the 'y-axis'
    lowerBound=0.25;
    upperBound=0.35;
    
    % % % % numberOfPlanes - Specify a numeric value to specify the number
    % of planes needed to be created between the lowerBound and upperBound
    numberOfPlanes=1;

%Getting the sections from the specified .stl files:
    
    polygonsCellMembrane=getSections(fileName,parallelTo,lowerBound,upperBound,numberOfPlanes);
    
 %Getting the girth for the section:
    
    girth=getGirth(section,polygonsCellMembrane,parallelTo);
   
 %Final Output:
 disp ("girth in cm:");
 disp (girth*100);
    
