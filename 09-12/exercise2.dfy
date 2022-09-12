method DoSomething(a: array<int>, n: int, e: int)
    requires 0 <= n < a.Length
    modifies a 
    ensures multiset(a[..n+1]) == multiset(a[..n]) + multiset{e} //union
{
    a[n] := e;
    assert a[..n+1] == a[..n] + [e]; //concatenation
}