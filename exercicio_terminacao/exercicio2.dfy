predicate Par(x:nat)
{
    x % 2 == 0
}

method FazAlgo(a:int, b:int) returns (x:int, y:int)
  requires a >= b && Par(a-b)
  ensures x == y
{
    x := a;
    y := b;
    while !(x == y)
      invariant x-y >= 0 && Par(x-y)
      decreases x-y
    {
        x := x -1;
        y := y + 1;
    }
}