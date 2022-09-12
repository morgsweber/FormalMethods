method Main()
{
    var s1: set<int> := {}; //empty set
    var s2 := {1,2,3};

    //equality
    assert {1,2} == {2,1};
    assert {1,1,2} == {1,2};
    assert s2 != s1;

    //cardinality
    assert |s1| == 0;
    assert |s2| == 3;

    //belongs(contained)
    assert 1 in s2;
    assert 0 !in s1;

    //subset
    assert {1} <= {1,2};
    assert {} < {1,2};
    assert {1,2} >= {1,2};
    assert {1,2} > {};

    //disjunction
    assert {1,2} !! {3,4};

    //union 
    assert {1,2} + {2,3,4} == {1,2,3,4};

    //intersection
    assert {1,2} * {2,3,4} == {2};

    //differece
    assert {1,2,3} - {1,2} == {3};


}