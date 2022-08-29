method Main()
{
    var a := new nat[4];
    print a[0];
    a[3] := 4;
    assert a[3] == 4;
    assert a.Length == 4;
}