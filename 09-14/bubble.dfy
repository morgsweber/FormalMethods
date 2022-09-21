predicate Permutation(a:seq<int>, b:seq<int>)
{
    multiset(a) == multiset(b)
}

predicate OrderedBetween(a:array<int>, e:int, d:int)
    reads a
    requires 0 <= e <= d <= a.Length
{
    forall i,j :: e <= i <= j < d ==> a[i] <= a[j]
}

predicate Ordered(a:array<int>)
    reads a 
{
    OrderedBetween(a,0,a.Length)
}

method BubbleSort(a:array<int>)
    modifies a 
    ensures Ordered(a)
    ensures Permutation(a[..], old(a[..]))
{
    if a.Length > 1
    {
        var i := 1;
        while i < a.Length
            invariant 1 <= i <= a.Length
            invariant OrderedBetween(a,0,i)
            invariant Permutation(a[..], old(a[..]))
        {
            BubbleStep(a,i);
            i := i + 1;
        }
    }
}

method BubbleStep(a:array<int>, i:int)