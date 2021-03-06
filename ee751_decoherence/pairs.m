clc
%Generate spin pairs and corresponding hamiltonian from InAs dot
%structure of QD = [rx,ry,rz,J,mj]
%load QD;
%QD_6 = InAs_dot(150,150,25,6);
InAs_QD = InAs_dot(20,20,12,6);

qdot = InAs_QD;
size(qdot,1)
num_pair = nchoosek(size(qdot,1),2)
sigma_x = [ 0 1 ; 1 0]; %Pauli matrices
sigma_y = [ 0 -1i; 1i 0];
sigma_z = [ 1 0; 0 -1];
w_e = 2*10^12; %per second refer Table 2 Ren-Bao Liu et al 2007 New J. Phys. 9 226
mag_p = zeros(num_pair,4);
mag_n = mag_p;
save ('dot_20_12_6' , 'InAs_QD' ,'num_pair','w_e');
tic
for k = 1:num_pair
    if mod(100*k/num_pair,10) == 0
        10*k/num_pair
%         toc
%         tic
        save ('dot_20_12_6' , 'mag_n','mag_p');
    end
    nm = get_nm(k,size(qdot,1));
    const = get_constants(w_e,nm(1),nm(2),qdot);
    v_p = pseudo_mag(0.5,const);
    mag_p(k,:) = [norm(v_p,2),v_p/(norm(v_p,2))];
    v_n = pseudo_mag(-0.5,const);
    mag_n(k,:) = [norm(v_n,2),v_n/(norm(v_n,2))];
end
toc
 save ('dot_20_12_6' , 'mag_n','mag_p');