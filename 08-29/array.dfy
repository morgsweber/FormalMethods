method Main()
{
    var b := new int[3];
    var a := new int[4];
    
    print a[0];
    a[3] := 4;
    assert a[3] == 4;
    assert a.Length == 4;

    b := a;
    assert b.Length == 4;
    assert b[3] == 4;
    b := new int[6];

    var element := 0;

    
}