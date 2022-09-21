class {:autocontracts} Cell
{
    var data: int;
    constructor ()
      ensures data == 0
    {
        data := 0;
    }
}

class {:autocontracts} Counter
{
    //Counter is represented by increment and decrement operations number
    //stored in a object Cell
    var incs: Cell;
    var decs: Cell;
    // value is a abstract representation
    ghost var value: int;

    predicate Valid()
    {
        incs != decs &&
        value == incs.data - decs.data
    }

    constructor ()
      ensures value == 0
    {
        incs := new Cell();
        decs := new Cell();
        value := 0;
    }

    method Increment()
      ensures value == old(value) + 1
    {
        incs.data := incs.data + 1;
        value := value + 1;
    }
    
    method Decrement()
      ensures value == old(value) - 1
    {
        incs.data := incs.data - 1;
        value := value - 1;
    }

    method GetValue() returns (v:int)
      ensures v == value
    {
        v := incs.data - decs.data;
    }
}

method Main()
{
    var c := new Counter();
    c.Increment();
    c.Increment();
    c.Decrement();
    c.Increment();
    assert c.value == 2;
}