class Counter
{
    var value: int;

    // anon contructor
    constructor ()
      ensures value == 0
    {
        value := 0;
    }

    //contruct with name
    constructor Init(v:int)
      ensures value == v
    {
        value := v;
    }

    method Incrementa()
      modifies this
      ensures value == old(value) + 1
    {
        value := value + 1;
    }

    method Decrementa()
      modifies this
      ensures value == old(value) - 1
    {
        value := value -1 ;
    }

    method GetValue() returns (v:int)
      ensures v == value
    {
        return value;
    }
}

method Main()
{
    var c := new Counter(); // create a new object on heap by anon consctructor
    var c2 := new Counter.Init(10); // create a new object on heap by contrusctor with name
    var v := c.GetValue();
    assert v == 0;
    var v2 := c2.GetValue();
    assert v2 == 10;
    c.Incrementa();
    v := c.GetValue();
    assert v == 1;
    c.Decrementa();
    v := c.GetValue();
    assert v == 0;

}