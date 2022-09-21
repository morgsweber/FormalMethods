class Counter
{
    //Counter is represented by increment and decrement operations number
    // Concrete mplementation should be "invisible" on contracts
    var incs: int;
    var decs: int;
    // value is a abstract representation
    // the methods's public contract just can refer the "value"
    ghost var value: int;

    // Class invariante
    predicate Valid()
    reads this
    {
        value == incs - decs
        && incs >= 0
        && decs >= 0
    }

    constructor ()
    ensures Valid()
    ensures value == 0
    {
        incs := 0;
        decs := 0;
        value := 0;
    }

    method increment()
    requires Valid()
    modifies this
    ensures Valid()
    ensures value == old(value) + 1
    {
        incs := incs + 1;
        value := value + 1;
    }

    method decrement()
    requires Valid()
    modifies this
    ensures Valid()
    ensures value == old(value) - 1
    {
        decs := decs + 1;
        value := value - 1;
    }

    method getvalue() returns (v:int)
    requires Valid()
    ensures v == value
    ensures Valid()
    {
        return incs - decs;
    }
}

method Main()
{
    var c := new Counter();
    var v := c.getvalue();
    assert v == 0;
    c.increment();
    var v2 := c.getvalue();
    assert v2 == 1;
}