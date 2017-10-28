function pair = get_nm(k,N)
%gives indices for kth pair
tot = nchoosek(N,2);
if k > tot || k < 1
    error('Error. k becomes greater than total pairs')
end

l = 1;n=1;m=1;i=0;
for j = N-1:-1:1
    if k <= (i+j)
        n = l;
        m = k-i+n;
        break
    else
        l = l+1;
        i = i+j;
    end
end
pair = [n m];

end