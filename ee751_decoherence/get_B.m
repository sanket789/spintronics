function B = get_B(n,m,v_dot)
%Use near neighbour coupling
r = norm(v_dot(n,1:3) - v_dot(m,1:3));
if r < 9
    B = 100;
else 
    B = 0;
end

end

