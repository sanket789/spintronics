%main 
%Quantum dot with Ga69As75
clc
clear 
%%
t_i = 0;
t_f = 2;
t_step = 0.01;
nT = (t_f - t_i)/t_step;
load('dot_20_12_6','mag_n','mag_p');
% load mag_p;
% load mag_n;
num_pair = size(mag_p,1);
fid = zeros(nT+1,2);
tic
for i = 1:nT+1
    if mod(100*i/nT,2) == 0
        100*i/nT
    end
    fid(i,1) = (i-1)*10^(-7);
    coh =1;
    for k = 1:num_pair
        theta_p = abs(mag_p(k,1)*fid(i,1)*0.5);
        theta_n = abs(mag_n(k,1)*fid(i,1)*0.5);
        
        coh = coh*abs((cos(theta_n) + 1j*sin(theta_n)*mag_n(k,4))*(cos(theta_p) - 1j* sin(theta_p)*mag_p(k,4)) + sin(theta_n)*sin(theta_p)*mag_p(k,2)*mag_n(k,2));
    end
    fid(i,2) = coh;
end
toc
fid_2_12_n = fid;
save fid_2_12_n;
%%
% pair = zeros(nchoosek(size(v_dot,1),2),3);  %contains pair indices
% mag_p = zeros(nchoosek(size(v_dot,1),2),4); %pseudomagnetic norm and unit vector for each pair
% mag_n = mag_p;

% % sigma_x = [ 0 1 ; 1 0]; %Pauli matrices
% % sigma_y = [ 0 -1i; 1i 0];
% % sigma_z = [ 1 0; 0 -1];

% count =1;
% for j = 1:size(v_dot,1)-1
%     for k = j+1:size(v_dot,1)
%         pair(count,1) = count;
%         pair(count,2) = j;
%         pair(count,3) = k;
%         count = count +1;
%     end
% end
% l=2;
% for k = 1:num_pair
%     
%     n = k;
%     m = l;
%     l = l+1;
%     v_constants = get_constants(zeeman_e,n,m,v_dot);
%     mag = pseudo_mag(0.5,v_constants);
%     mag_p(k,1) = norm(mag,2);
%     mag_p(k,2:4) = mag/(norm(mag,2));
%     mag = pseudo_mag(-0.5,v_constants);
%     mag_n(k,1) = norm(mag,2);
%     mag_n(k,2:4) = mag/(norm(mag,2));   
% end

%%
% % tic
% % for i = 1:nT+1
% %     fid(i,1) = (i-1)*t_step*1e-6;
% %     if mod(fid(i,1),1e-6)==0
% %         fid(i,1)
% %     end
% %     coh = 1;
% %     for k = 1:num_pair
% %         pair_nm = get_nm(k,size(v_dot,1));
% %         n = pair_nm(1);
% %         m = pair_nm(2);
% %         
% %         v_constants = get_constants(zeeman_e,n,m,v_dot);
% %         v_mag_p = pseudo_mag(0.5,v_constants);
% %         mag_p = [norm(v_mag_p,2) v_mag_p/norm(v_mag_p,2)];
% %         v_mag_n = pseudo_mag(-0.5,v_constants);
% %         mag_n = [norm(v_mag_n,2) v_mag_n/norm(v_mag_n,2)];
% %         
% %         theta = mag_n(1)*0.5*fid(i,1);
% %         u_theta = mag_n(2)*sigma_x + mag_n(3)*sigma_y + mag_n(4)*sigma_z;
% %         
% %         phi = mag_p(1)*0.5*fid(i,1);
% %         u_phi = mag_p(2)*sigma_x + mag_p(3)*sigma_y + mag_p(4)*sigma_z;
% %         
% %         mat = (cos(theta)*eye(2) + 1j*sin(theta)*u_theta)*(cos(phi)*eye(2) - 1j*sin(phi)*u_phi);
% %         
% %         coh = coh*abs(mat(1,1));
% %         
% %     end
% %     fid(i,2) = coh;
% % end
% % toc
