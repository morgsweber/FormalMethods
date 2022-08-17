function Sum(m:nat, n:nat):nat
//decreases: varian expression, that proofs the will end
decreases n 
{
    if n == 0 
    then m 
    else Sum(m, n-1)+1 //This is not a code, is just an expression!!!!!
}


/* 
    Sum: N x N -> N
    |Sum(m,n) = m, if n = 0
    |Sum(m,n) = Sum(m, n+1)+1, if n>0
*/