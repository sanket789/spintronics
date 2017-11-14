function const = get_constants(Omega_e,n,m,v_dot)
%Function to obtain constants
%QD = [rx,ry,rz,J,mj]

if v_dot(n,4) == v_dot(m,4)
    j = v_dot(n,4);
    m_n = v_dot(n,5);
    m_m = v_dot(m,5);
    a_n = get_A(n,v_dot);
    a_m = get_A(m,v_dot);
    factor = sqrt(j*(j+1)-m_n*(m_n+1))*sqrt(j*(j+1)-m_m*(m_m-1));
    A = (a_n*a_m*0.25/Omega_e)*factor;
    B = get_B(n,m,v_dot)*factor;
    flag = 1;
else 
    A = 0;
    B = 0;
    flag = 0;
end
D = 0;
for i=1:size(v_dot,1)
    D = D + get_D(n,i,v_dot)*v_dot(i,5) - get_D(m,i,v_dot)*v_dot(i,5);
end

D = D - get_D(n,m,v_dot);
E = 0.5*(get_A(n,v_dot) - get_A(m,v_dot));

const = [A,B,D,E,flag];
end

