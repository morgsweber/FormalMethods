predicate Permutation(a: seq<int>, b: seq<int>)
{
    multiset(a) == multiset(b) //verify if exists permutation
}

method Main()
{
    var a := new int[3];
    a[0], a[1], a[2] := 1, 2, 3;
    var b := new int[3];
    b[0], b[1], b[2] := 3,1,2;

    assert a[..] == [1,2,3];
    assert b[..] == [3,1,2];
    assert Permutation(a[..],b[..]);
}