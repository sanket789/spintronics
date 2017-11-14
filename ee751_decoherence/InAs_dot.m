%Generate quantum dot structure with [j,m_j,rx,ry,rz] with N number of
%nuclei
function qdot = InAs_dot(Lx,Ly,Lz,a)
Nx = floor(4*Lx/a);
Ny = floor(4*Ly/a);
Nz = floor(4*Lz/a);
In = zeros((Nx+1)*(Ny+1)*(Nz+1),5);
%(Nx+1)*(Ny+1)*(Nz+1)
k=0;
a1 = (a/sqrt(2))*[0 1 1];
a2 = (a/sqrt(2))*[1 0 1];
a3 = (a/sqrt(2))*[1 1 0];
x_hat = [1/sqrt(2),0.5,-0.5];
y_hat = [1/sqrt(2),-0.5,0.5];
z_hat = [0,1/sqrt(2),1/sqrt(2)];
tic
for n = -Nx:Nx
    for l = -Ny:Ny
        for m = -Nz:Nz
            pos = n*a1 + l*a2 + m*a3;
            if abs(dot(pos,x_hat))<(a+Lx/2) && abs(dot(pos,y_hat))<(a+Ly/2) && abs(dot(pos,z_hat))<(a+Lz/2)
                In(k+1,1:3) = pos;
                In(k+1,4) = 4.5;
                In(k+1,5) = 1/2;
                k = k+1;
            end                
        end
    end
end
As = zeros(k,5);
for m = 1:k
    As(m,1:3) = In(m,1:3) + [0.25*a 0.25*a 0.25*a];
    As(m,4) = 3/2;
    As(m,5) = -1/2;
end
toc
qdot = [In(1:k,:);As];
end