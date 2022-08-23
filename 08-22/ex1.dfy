method Mult(x:nat, y:nat) returns (r:nat) //params are immutable 
ensures r == x*y
{
    var m := x;
    var n := y; //That's why we assign x and y to m and n
    r := 0;
    while m > 0
    invariant m >= 0 //starts with a number >= 0 
    invariant m*n+r == x*y
    {
        r := r+n;
        m := m-1;
    }
    return r; // ~(m > 0) ^ invariant => r = x*y
}

/*
      x | y | m | n | r | invariant = m*n+r = x*y
--------------------------------------------------
 E0 - 5 | 3 | 5 | 3 | 0 | 5 * 3 + 0 = 5 * 3
 E1 - 5 | 3 | 4 | 3 | 3 | 4 * 3 + 3 = 5 * 3
 E2 - 5 | 3 | 3 | 3 | 6 | 3 * 3 + 6 = 5 * 3
 E3 - 5 | 3 | 2 | 3 | 9 | 2 * 3 + 9 = 5 * 3 
 E4 - 5 | 3 | 1 | 3 | 12| 1 * 3 + 12 = 5 * 3
 E5 - 5 | 3 | 0 | 3 | 15| 0 * 3 + 15 = 5 * 3

*/