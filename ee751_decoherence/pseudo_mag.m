function h_k = pseudo_mag(m_s,v_const)

A = v_const(1);
B = v_const(2);
D = v_const(3);
E = v_const(4);
sign = 2*m_s;
h_k = [sign*2*A + 2*B , 0 , sign*E + D];
end