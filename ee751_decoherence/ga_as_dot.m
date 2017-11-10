%Generate quantum dot structure with [j,m_j,rx,ry,rz] with N number of
%nuclei
function dot = ga_as_dot(N,a)
Nx = (N/3)^(1/3);
Nx = round(Nx);
Ny = Nx;
Nz = Nx;
Ga_pos = zeros((Nx+1)^3,6);
As_pos = zeros((Nx+1)^3,6);
l=1;
for i=0:Nx
    for j=0:Ny
        for k=0:Nz
            rx = a*(i+k)/sqrt(2);
            ry = a*(j+k)/sqrt(2);
            rz = a*(i+j)/sqrt(2);
            J_1 = 3/2;
            m_j_1 = 1/2;
            Ga_pos(l,:) = [69,J_1,m_j_1,rx,ry,rz];
            l = l+1;
        end
    end
end

for i = 1:l-1
    As_pos(i,4:6) = [Ga_pos(i,4)+0.25*a,Ga_pos(i,5)+0.25*a,Ga_pos(i,6)+0.25*a];
    J_2 = 3/2;
    m_j_2 = 1/2;
    As_pos(i,1:3) = [74,J_2,m_j_2];
end

dot = [Ga_pos;As_pos];
end