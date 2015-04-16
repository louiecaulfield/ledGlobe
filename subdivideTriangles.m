function triangles = subdivideTriangles(t, n)
% Splits up each triangle in t up into 4 new triangles by taking the middle
% of each edge as a new vertex
%
% returns a list with 4 times the number of triangles as given

tin = t;
for k=1:n
    n_triangles = length(tin);
    triangles(n_triangles*4) = triangle();
    for i=1:n_triangles
        triangles((1:4) + 4 * (i-1)) = tin(i).Subdivide();
    end
    tin = triangles;
end