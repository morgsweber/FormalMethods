method Main()
{
    var empty: seq<int> := [];
    var s := [1,2,3,4,5]; //it's a sequence or list, not an array!!!

    assert |s| == 5;
    assert s[0] == 1;
    assert s[1..3] == [2,3];
    assert s[1..] == [2,3,4,5];
    assert s[..3] == [1,2,3];

    assert 1 in s;
    assert 0 !in s;

    assert [1,2] + [3,4] == [1,2,3,4];

    assert empty < s; //prefix
    assert [1,2] < s;
    assert [1,2,3,4,5] <= s;
    assert s[2..2] == [];

    assert s[2 := 0] == [1,2,0,4,5]; //the same list, but with a 0 in the second position

    s := s - 1;

}