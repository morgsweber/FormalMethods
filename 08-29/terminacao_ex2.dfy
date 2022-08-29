predicate Pair(n:int)
{
    n % 2 == 0
}

method DoSomething(a:int, b:int) returns (x:int, y:int)
requires a >= b && Pair(a-b)
{
    x := a;
    y := b;
    while x != y
    invariant x >= y
    invariant Pair(x-y)
    decreases x-y
    {
        x := x-1;
        y :=y+1;
    }
}