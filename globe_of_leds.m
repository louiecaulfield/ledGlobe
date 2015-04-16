r_led = 5.9; %mm (Kinbright tru hole)
r_globe = 150; %mm (Globe as big as about A4)

A_globe = 4 * pi * r_globe^2; %mm^2
A_led = pi * r_led ^ 2; %mm^2

angle_between_leds = r_led / r_globe

%% icosahedron

% Compute vertices
v = zeros(12,3)
% lower vertex
v(1,:) = [0 0 -1];
theta = 26.56505117707799 * pi / 180;
phi = pi / 5;
for i=2:6
    v(i,:) = [...
        cos(theta) * cos(phi)...
        cos(theta) * sin(phi)...
        -sin(theta)];
    phi = phi + 2 * pi / 5;
end
%lower pentagon
phi = 0;
for i=7:11
    v(i,:) = [...
        cos(theta) * cos(phi)...
        cos(theta) * sin(phi)...
        sin(theta)];
    phi = phi + 2 * pi / 5;
end
%top vertex
v(12,:) = [0 0 1];

% Arrange into icosahedron
triangles = [...
    triangle(v( 1,:), v( 3,:), v( 2,:))
    triangle(v( 1,:), v( 4,:), v( 3,:))
    triangle(v( 1,:), v( 5,:), v( 4,:))
    triangle(v( 1,:), v( 6,:), v( 5,:))
    triangle(v( 1,:), v( 2,:), v( 6,:))
    triangle(v( 2,:), v( 3,:), v( 8,:))
    triangle(v( 3,:), v( 4,:), v( 9,:))
    triangle(v( 4,:), v( 5,:), v(10,:))
    triangle(v( 5,:), v( 6,:), v(11,:))
    triangle(v( 6,:), v( 2,:), v( 7,:))
    triangle(v( 2,:), v( 8,:), v( 7,:))
    triangle(v( 3,:), v( 9,:), v( 8,:))
    triangle(v( 4,:), v(10,:), v( 9,:))
    triangle(v( 5,:), v(11,:), v(10,:))
    triangle(v( 6,:), v( 7,:), v(11,:))
    triangle(v( 7,:), v( 8,:), v(12,:))
    triangle(v( 8,:), v( 9,:), v(12,:))
    triangle(v( 9,:), v(10,:), v(12,:))
    triangle(v(10,:), v(11,:), v(12,:))
    triangle(v(11,:), v( 7,:), v(12,:))
    ];
%% subdivide
subdivided = subdivideTriangles(triangles,3)
%% Plot them triangles
plotTriangles(subdivided)
%%
areas = zeros(length(subdivided),1);
for i = 1:length(subdivided)
    areas(i) = subdivided(i).Area();
end
