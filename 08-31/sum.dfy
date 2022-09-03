function sum(a:array<nat>):nat
requires a.Length > 0
requires i < a.Length
reads a
{
    if i == 0
    then a[i]
    else a[i] + sum(a, i-1)
}

method sum(a:array<nat>) returns (s:nat)
requires a.Length > 0
ensures s == sum(a, a.Length-1)
{
    s := 0;
    for i := to a.Length-1
    invariant 
    {
        s := s + a[i];
    }
}