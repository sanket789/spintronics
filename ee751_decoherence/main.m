%main 
%Quantum dot with Ga69As75
clc
clear 
%%
a = 1;
N = 1e5;
zeeman_e = (100e-6)*(1.6e-19);
%%
t_i = 0;
t_f = 10;
t_step = 0.1;
nT = (t_f - t_i)/t_step;
v_dot = ga_as_dot(N,a);
pair = zeros(nchoosek(size(v_dot,1),2),3);  %contains pair indices
mag_p = zeros(nchoosek(size(v_dot,1),2),4); %pseudomagnetic norm and unit vector for each pair
mag_n = mag_p;

sigma_x = [ 0 1 ; 1 0]; %Pauli matrices
sigma_y = [ 0 -1i; 1i 0];
sigma_z = [ 1 0; 0 -1];

count =1;
for j = 1:size(v_dot,1)-1
    for k = j+1:size(v_dot,1)
        pair(count,3) = count;
        pair(count,2) = j;
        pair(count,3) = k;
        count = count +1;
    end
end

for k = 1:size(pair,1)
    n = pair(k,2);
    m = pair(k,3);
    v_constants = get_constants(zeeman_e,n,m,v_dot);
    mag = pseudo_mag(0.5,v_constants);
    mag_p(k,1) = norm(mag,2);
    mag_p(k,2:4) = mag/(norm(mag,2));
    mag = pseudo_mag(-0.5,v_constants);
    mag_n(k,1) = norm(mag,2);
    mag_n(k,2:4) = mag/(norm(mag,2));   
end

fid = zeros(nT+1,2);
for i = 1:nT+1
    fid(i,1) = (i-1)*t_step*1e-6;
    if mod(fid(i,1),1e-6)==0
        fid(i,1)
    end
    coh = 1;
    for k = 1:size(pair,1)
        theta = mag_n(k,1)*0.5*fid(i,1);
        u_theta = mag_n(k,2)*sigma_x + mag_n(k,3)*sigma_y + mag_n(k,4)*sigma_z;
        
        phi = mag_p(k,1)*0.5*fid(i,1);
        u_phi = mag_p(k,2)*sigma_x + mag_p(k,3)*sigma_y + mag_p(k,4)*sigma_z;
        
        mat = (cos(theta)*eye(2) + 1j*sin(theta)*u_theta)*(cos(phi)*eye(2) - 1j*sin(phi)*u_phi);
        
        coh = coh*abs(mat(1,1));
        
    end
    fid(i,2) = coh;
end
