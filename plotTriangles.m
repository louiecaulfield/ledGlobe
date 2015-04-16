function [vertices, faces] = plotTriangles(triangles)

n_triangles = length(triangles);
vertices = zeros(n_triangles, 3);
faces = zeros(n_triangles, 3);

for i=1:length(triangles)
    t = triangles(i);
    indices = (1:3) + (i-1) * 3;
    vertices(indices, :) = t.vertices;
    faces(i, :) = indices;
end

patch('Vertices', vertices, 'Faces', faces, 'FaceColor', 'g',...
    'EdgeColor', 'none', 'FaceAlpha', 0.7);
camlight;
end