%Hyperfine constant
function A = get_A(n,v_dot)
%A = 1e6;
rx = dot(v_dot(n,1:3),[1/sqrt(2),0.5,-0.5]);
ry = dot(v_dot(n,1:3),[1/sqrt(2),-0.5,0.5]);
rz = dot(v_dot(n,1:3),[0,1/sqrt(2),1/sqrt(2)]); 

Lx = 330; Ly = 330; Lz = 30; a = 6; %all in angstrom
if v_dot(n,1) == 3/2    %Arsenic Table 1
    alpha = 69.8*10^9;
else
    alpha = 85.3*10^9;  %Indium
end
A = alpha*(a^3)*((8/(Lx*Ly*Lz))^(0.5)*cos(pi*rx/Lx)*cos(pi*ry/Ly)*cos(pi*rz/Lz))^2;

end