method ChangeElements(a:array<int>, i:int, j:int)
    requires 0 <= i < j < a.Length
    modifies a
    //ensures multiset(a[..]) == multiset(old(a[..]))
    //the elements from 'a' are the same, but in different order
    //keep the order from the elements, except the I and j position 
    ensures a[j] == old(a[i]) && a[i] == old(a[j])
    ensures forall k :: 0 <= k < a.Length 
                    && k != i && k != j ==> a[k] == old(a[k])
    {
        a[i], a[j] := a[j], a[i];
    }

    method Main(){
        var a:= new int[3];
        a[0], a[1], a[2] := 0,1,2;
        ghost var before := a;
        ChangeElements(a,0,2);
        assert multiset(a[..]) == multiset(before[..]);
    }