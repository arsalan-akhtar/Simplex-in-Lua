-- test opt simplex
matrix=require"matrix"
Optimize=require "Optimize"

L=2
E=0
G=0
N=2
F=1
-- [L+E+G+F,N+L+E+G+G+2]
--A=matrix(106,122,0)
A=matrix(10,10,0)

A[1][2]=1
A[1][3]=1
A[1][6]=1
A[2][2]=-1
A[2][3]=1
A[2][6]=0
A[3][2]=2
A[3][3]=1

Optimize.Simplex(L,E,G,N,F,A)