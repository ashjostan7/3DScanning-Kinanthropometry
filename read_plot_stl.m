%Reading the stl file::
[vertsMembrane,facesMembrane,n,name]  = stlRead('E:\Univeristy Modules\Applied Measurements\stl-files-waist\se001_mesh-1-waist.stl');
%E:\Univeristy Modules\Applied Measurements\stl-files-waist\
%VertsMembrane are the vertices
%facesMembrane are the faces
%n are the normals
%NAME is the name of the STL object (NOT the name of the STL file)

stlPlot(vertsMembrane, facesMembrane, name);
xlabel('X-axis (girth)');
ylabel('Y-axis');
zlabel('Z-axis');
beep 