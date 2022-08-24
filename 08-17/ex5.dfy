/*
    Fat: N -> N
    |Fat(n) = 1, if n = 0
    |Fat(n) = n * Fat(n-1), if n > 0
*/

//Definition
function Fat(n:nat):nat
{
    if n == 0
    then 1
    else n * Fat(n-1)
}

//Implementation
method Factorial(n:nat) returns (r:nat)
ensures r == Fat(n)
{
    r := 1;
    var i := 1;
    while i <= n
        invariant 1 <= i <= n+1
        invariant r == Fat(i-1)
    {
        r := r*i;
        i := i+1;   
    }
    return r;
}