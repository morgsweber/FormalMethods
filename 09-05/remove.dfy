method Remove(a:array<int>, end:nat, start:nat, n:nat)
    requires end <= a.Length
    requires start + n <= end
    modifies a
    // ensure how will start the array
    ensures a[..start] == old(a)[..start] //old - the value before execute 
    // ensure where will appear the OLD end
    ensures a[start..end-n] == old(a)[start+n..end]
    {
        var i:nat := 0;
        while i < end-(start+n)
            invariant i <= end - (start+n)
            invariant a[..start] == old(a)[..start]
            invariant a[start..start+i] == old(a)[start+n..start+n+i]
        {
            a[start+i] := a[start+n+i];

            /* i | a[start+i := a[start+n+i]    
               0 | A[2] = A[4]
               1 |
            */
        }
    }


    /*
    end = 4
    start = 2
    n = 2 

    before 
    0 1 2 3 4 

    after 
    0 1 4 _ _-> 0..1 A[..start] and 4 A[start..end-n]
    start = 0 1
    old end = 4

    */