-- Simplex in Lua--------------------------------------

--[[

1---Type of variables:
    L:number of constraints"<="
    E:....................."="
    G:.....................">="
    N:.......... variables
    F: = 1, if maximize
       =-1, if minimize
    A:coefficient matrix of the simples
      matrix is arranged in the following sequance:
      1. <=
      2. =
      3. >=
      4. objective
    Remark: initialize matrix A ???

2---How to use it
    Simplex(L,G,E,N,F,A)

3---Error information
    .....................

4---Dependent
    Matrix Lua ???

]]--

function Simplex(L,G,E,N,F,A)

-- Initialize Variable Value----------------------------
    Stop=false

-- Initialization---------------------------------------
    for i=1,N do
        A[L+E+G][i]=-F*A[L+E+G][i]
    end
    Error=0
    C=1
    M=L+G+E
    B=M+N+G+1
    W=M
    M=M-1
    H=1
    for k=1,(M+1) do
        A[k-1][N+G+k]=1
        A[k-1][0]=k+N+G
    end

-- BlocA------------------------------------------------
    for k=(L+E+1),(M+1) do
        A[k-1][k+N-L-E]=-1
    end
    W=W+1
    Q=0
    for j=1,(N+G) do
        S=0
        for i=M-G-E+1,M do
            S=S+A[i][j]
        end
        A[W][j]=-S
        if A[W][j]<=Q then
            Q=A[W][j]
            C=j
        end
    end

-- BlocB1-----------------------------------------------
    H=H+1
    Q=9.9e37
    R=-1
    for i=0,M do
        if A[i][C]>0 then
            if (A[i][B]/A[i][C])<=Q then
                Q=A[i][B]/A[i][C]
                R=i
            end
        end
    end

-- BlocB2-----------------------------------------------
    P=A[R][C]
    A[R][0]=C
    for j=1,B do
        A[R][j]=A[R][j]/P
    end
    for i=0,W do
        if i~=R then
            for j=1,B do
                if j~=C then
                    A[i][j]=A[i][j]-A[R][j]*A[i][C]
                    if math.abs(A[i][j])<1e-9 then
                        A[i][j]=0
                    end
                end
            end
        end
    end
    for i=0,W do
        A[i][C]=0
    end
    A[R][C]=1

-- BlocC------------------------------------------------
    Q=0
    for j=1,(N+G+L) do
        if A[W][j]<=Q then
            Q=A[W][j]
            C=j
        end
    end

-- BlocD------------------------------------------------
    if (not Stop) then
        i=-1
        while (Stop or (i==M)) do
            i=i+1
            if ( (A[i][0]>=(N+G+L+1)) and (A[i][B]~=0) ) then
                Stop=true
                Error=2
            end
        end
    end

-- BlocE------------------------------------------------
    for i=1,N do
        j=-1
        Stop1=false
        while ((A[j][0]==i) or Stop1) do
            j=j+1
            if j>W+1 then
                Result[i]=0
                Stop1=true
            end
        end
        if (not Stop1) then
            Result[i]=A[j][B]
        end
    end
    Objective=F*A[W][B]

-- BlocE------------------------------------------------










end
-- Fine---------------------------------------


