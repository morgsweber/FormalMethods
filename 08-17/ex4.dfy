//Absolut(1) = 1
//Absolut(-1) = -1

method Absolut(x:int) returns (r:int)
ensures r >= 0 //many ensures will be use an "and" condition between each one 
ensures x < 0 ==> r == -x // "==>" it's a logical implicator 
ensures x >= 0 ==> r == x

//Other way to write the lines above:
// ensures r >= 0 && (r == x || r == -x)
{
    if x < 0
    {
        return -x;
    }
    else 
    {
        return x;
    }
}