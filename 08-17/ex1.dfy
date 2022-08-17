//Dafny is a strong typed language
//Works with int, real(float) and nat(natural numbers)
method Triple(x:int) returns (r:int)
//pre condition: 
requires true 
//pos condition:
ensures r == 3*x //the result needs to be 3 * the x
{
    r := 3*x; 
    /*
        same as return 3*x
        and 
        var y := 2*x;
        return y + x;
    */
}

/*
Sintax information: 
    to assign a value, we use ':='
    at the and of each command, use ';'  
*/