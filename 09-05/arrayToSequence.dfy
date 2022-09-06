method Main()
{
    var a := new int[5];
    a[0] := 0;
    a[1] := 1;
    a[2] := 2;
    a[3] := 3;
    a[4] := 4;

    //if we use this operators in array, we have a sequence as a result
    assert a[..] == [0,1,2,3,4];
    assert a[1..3] == [1,2];
    assert a[2..] == [2,3,4];
    assert a[..2] == [0,1];
    //the element '5' is not in the array
    assert 5 !in a[..];

    var s := a[..];
}