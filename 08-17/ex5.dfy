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
    var i := 0;
    while i < n
    {
        i := i+1;
        r := r*i;
    }

    return r;
}