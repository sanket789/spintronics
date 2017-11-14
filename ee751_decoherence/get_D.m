function D = get_D(n,m,v_dot)
%Near neighbour coupling
r = norm(v_dot(n,1:3) - v_dot(m,1:3));
if r < 9
    D = 100;
else 
    D = 0;
end


end