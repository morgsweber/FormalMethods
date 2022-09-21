class Cell
{
    var data: int;
    constructor ()
      ensures data == 0
    {
        data := 0;
    }
}

class Counter
{
    //Counter is represented by increment and decrement operations number
    //stored in a object Cell
    var incs: Cell;
    var decs: Cell;
    // value is a abstract representation
    ghost var value: int;

    predicate Valid()
      //reads this, incs, decs
      //How solve the question of which Cell objects we have access? Dinamics frames
      reads this, incs`data, decs`data
      // just will could access the especific (data) attribute when we use `
    {
        incs != decs &&
        value == incs.data - decs.data &&
        incs.data >= 0 &&
        decs.data >= 0
    }

    constructor ()
      ensures value == 0
      ensures Valid()


    method Increment()
      requires Valid()
      ensures value == old(value) + 1
      ensures Valid()
    
    method Decrement()
      requires Valid()
      ensures value == old(value) - 1
      ensures Valid()

    method Getvalue() returns (v:int)
      requires Valid()
      ensures v == value
      ensures Valid()
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
