method M()
{
    var i, n := 0, 20;
    while i != n
      decreases n - i
    {
        i := i + 1;
    }
}

method M2()
{
    var i, n := 0, 20;
    while i < n
      decreases n - i
    {
        i := i + 1;
    }
}