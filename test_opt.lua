-- test opt simplex
matrix=require"matrix"
Opt=require "Opt"

L=2
E=0
G=2
N=2
F=-1
-- [L+E+G+F,N+L+E+G+G+2]
A=matrix(106,122,0)
A[1][2]=1
A[1][10]=1
A[2][3]=1
A[2][10]=1
A[3][2]=1
A[3][10]=-1
A[4][3]=1
A[4][10]=-1
A[5][2]=1
A[5][3]=2
--print(A)

Opt.Simplex(L,E,G,N,F,A)