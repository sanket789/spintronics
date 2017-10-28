function H_k = pseudo_hamiltonian(m_s,v_const)

A = v_const(1);
B = v_const(2);
D = v_const(3);
E = v_const(4);
f = 2*m_s;

h_k = [f*2*A+2*B , 0 , D+f*E];
sigma_x = [ 0 1 ; 1 0];
sigma_y = [ 0 -1i; 1i 0];
sigma_z = [ 1 0; 0 -1];
H_k = 0.5*(h_k(1)*sigma_x + h_k(2)*sigma_y + h_k(3)*sigma_z);

end