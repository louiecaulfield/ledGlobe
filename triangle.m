classdef triangle
    properties
        vertices
    end
    methods
        function obj=triangle(varargin)
            if(nargin == 0)
                v1 = [0 0 0]; v2 = v1; v3 = v1;
            elseif(nargin == 3)
                v1 = varargin{1};
                v2 = varargin{2};
                v3 = varargin{3};
            else
                error('wrong number of arguments');
            end
                    
            if(~(...
               isequal(size(v1), [1 3]) &&...
               isequal(size(v2), [1 3]) &&...
               isequal(size(v3), [1 3])))
                    error('vertices have wrong dimensions');
            end
            obj.vertices = [v1; v2; v3];
        end
        function a = Area(t)
            v12 = t.Vertex(2) - t.Vertex(1);
            v13 = t.Vertex(3) - t.Vertex(1);

            % compute area from cross product
            a = norm(cross(v12, v13))/2;
        end
        function v = Vertex(obj, i)
            v = obj.vertices(i, :);
        end
        function triangles = Subdivide(t)
            % new vertices
            a = (t.Vertex(1) + t.Vertex(2)) / 2;
            b = (t.Vertex(2) + t.Vertex(3)) / 2;
            c = (t.Vertex(3) + t.Vertex(1)) / 2;
            %normalize
            mean_norm = mean(sqrt(sum(abs(t.vertices).^2,2)));
            a = (a / norm(a)) * mean_norm;
            b = (b / norm(b)) * mean_norm;
            c = (c / norm(c)) * mean_norm;
            
            triangles(4) = triangle(a, c, b);
            triangles(1) = triangle(t.Vertex(1), a, c);
            triangles(2) = triangle(t.Vertex(2), b, a);
            triangles(3) = triangle(t.Vertex(3), c, b);
        end
    end
end