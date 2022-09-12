method Main()
{
    var ms1: multiset<int> := multiset{};
    var ms2 := multiset{1,1,1,2,3}; //Multiset can have repeated values, set no 

    //cardinality
    assert |ms1| == 0;
    assert |ms2| == 5;
    assert ms2[1] == 3;

    //belongs
    assert 1 in ms2;
    assert 1 !in ms1;

    //equality
    assert ms1 == multiset{};
    assert multiset{1,2,3,1,1} == ms2;

    //subset
    assert ms1 < ms2;
    assert multiset{1,2,1} <= ms2;

    //union
    assert multiset{1,1,1,2} + multiset{1,2} == multiset{1,1,1,1,2,2};

    //intersection
    assert multiset{1,1,1,2} * multiset{1,2} == multiset{1,2};

    //difference 
    assert multiset{1,1,1,2} - multiset{1,2} == multiset{1,1};

    //disjunction
    assert multiset{1,1} !! multiset{2,3,3};

    //alteration
    var ms3 := multiset{1,1,1,2,2,3};
    assert ms3[2 := 0] == multiset{1,1,1,3};
}