// add new element
function sumOpen(a:array<nat>, i:nat):nat
requires i <= a.Length
reads a 
{
    if i == 0
    then 0
    else a[i-1] + sumOpen(a,i-1)
}