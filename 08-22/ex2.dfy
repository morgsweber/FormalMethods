//Recursive specification 
function Potency(x:nat, y:nat):nat
{
    if y == 0
    then 1
    else x * Potency(x, y-1)
}

method Pot(x:nat, y:nat) returns (r:nat)
ensures r == Potency(x,y)
{
    r := 1; //is 1 because are successive multiplications 
    var b := x;
    var e := y;
    while e > 0
    invariant Potency(b,e)*r == Potency(x,y)
    {
        r := r*b;
        e := e-1;
    }

    return r; // ~(e>0) and b^e * r = x^y //that's the only thing true 
}

/*
Pot(2,3)
x | y | b | e |       r | invariant:  b^e*r = x^y
---------------------------------------------------
2 | 3 | 2 | 3 |       1 | 2^3 * 2^0 = 2^3
2 | 3 | 2 | 2 |     1*2 | 2^2 * 2^1 = 2^3
2 | 3 | 2 | 1 |   1*2*2 | 2^1 * 2^2 = 2^3
2 | 3 | 2 | 0 | 1*2*2*2 | 2^0 * 2^3 = 2^3
*/