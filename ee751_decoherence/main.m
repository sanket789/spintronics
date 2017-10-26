%main 
%Quantum dot with Ga69As75
clc
clear
%%
a = 1;
N = 100;
zeeman_e = (100e-6)*(1.6e-19);
%%
v_dot = ga_as_dot(N,a);
pair = zeros(nchoosek(size(v_dot,1),2),3);
hamilt_p = zeros(2*nchoosek(size(v_dot,1),2),2);
hamilt_n = hamilt_p;
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
    hamilt_p(2*k-1:2*k,:) = pseudo_hamiltonian(0.5,v_constants);
    
    hamilt_n(2*k-1:2*k,:) = pseudo_hamiltonian(-0.5,v_constants);
end
    
    
