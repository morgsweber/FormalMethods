method Triple(x:int) returns (r:int)
requires true 
ensures r == 3*x 
{
    var y := Double(x);
    return y+x;    
}

method Double(x:int) returns (r:int)
ensures r == 2*x
//We don't need the implementation of the second method, we need just the especification 