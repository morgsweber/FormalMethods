method Collatz(x:nat)
decreases * //the * disables the end verification 
{
    var n := x;
    while n > 1
    decreases *
    {
        n := if n%2 == 0 then n/2 else 3*n+1;
    } 
}