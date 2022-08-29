function Fib(n:nat) : nat
{
    if n < 2 
    then n
    else Fib(n-2) + Fib(n-1)
}

method ComputeFib(n:nat) returns (x:nat)
ensures x == Fib(n)
{
    x := 0;
    var y := 1;
    for i:= 0 to n 
    invariant x == Fib(i)
    invariant y == Fib(i+1)
    {
        x, y := y, x+y;
    }
}

method Test()
{
    var n := 3;
    var f := ComputeFib(n);
    assert f == 2; 
}