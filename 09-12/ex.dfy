method Main()
{
    var a := new int[3];
    a[0] := 1;
    a[1] := 0;
    a[2] := 1;

    var sequence := a[..];
    assert sequence == [1,0,1];
    var multiSet := multiset(sequence);
    assert multiSet == multiset{0,1,1};

    //how many occurrences of '1' are in array 'a'?
    assert multiset(a[..])[1] == 2;
}