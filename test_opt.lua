-- test opt simplex
matrix=require"matrix"
Opt=require "Opt"

L=3
E=0
G=0
N=2
F=1
-- [L+E+G+F,N+L+E+G+G+2]
--A=matrix(106,122,0)
A=matrix(10,10,0)

A[1][2]=1
A[1][3]=2
A[1][7]=8
A[2][2]=4
A[2][7]=16
A[3][3]=4
A[3][7]=12
A[4][2]=3
A[4][3]=9

Opt.Simplex(L,E,G,N,F,A)