import time
import scipy.special as sp

i = 0
N = int(sp.binom(1e4,2))
print N
t1 = time.time()
for n in range(1,N):
	if n%1e8 == 0:
		print n
	i = i+1

t2 = time.time()

t_tot = t2-t1

print t_tot