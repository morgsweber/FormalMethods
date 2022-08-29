function Fib(n:nat) : nat
{
    if n < 2 
    then n
    else Fib(n-2) + Fib(n-1)
}

method ComputeFib(n:nat) returns (x:nat)
ensures x == Fib(n)
{
    var i:= 0;
    x := 0;
    var y := 1;
    while i < n
        decreases n-i
        invariant 0 <= i <= n
        invariant x == Fib(i)
        invariant y == Fib(i+1)
    {
        x,y := y, x + y;
        i := i+1;
    }
}



/*

variant: n-1 
invariant: x = Fib(i)
n-1 | i | n | x | y |
---------------
 3  | 0 | 3 | 0 | 1 |
 2  | 1 | 3 | 1 | 1 |
 1  | 2 | 3 | 1 | 2 | 
 0  | 3 | 3 | 2 | 3 |

 */