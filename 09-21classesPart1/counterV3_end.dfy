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
    // Dynamic control of dynamic frames
    // Repr is the collection of objects that represent implemented class
    // In this case will be 'this (counter)', 'incs' (Cell 1) and 'decs' (Cell 2) 
    ghost var Repr: set<object> // dynamic frame 

    predicate Valid() // the valid should be true in the requires and ensures of all methods
      reads this, Repr
    {
        this in Repr && 
        incs in Repr &&// incs and decs should be in Repr to we have the reference to the object
        decs in Repr &&
        incs != decs &&
        value == incs.data - decs.data &&
        incs.data >= 0 &&
        decs.data >= 0
    }

    constructor ()
      ensures value == 0
      ensures Valid()
      ensures fresh(Repr - {this})
    {
        incs := new Cell();
        decs := new Cell();
        value := 0; // light gray is especification
        Repr := {this, incs, decs};
    }

    method Increment()
      requires Valid()
      modifies Repr
      ensures value == old(value) + 1
      // we didn't put ensures to incs.data because this expose the internal object's variable
      ensures Valid()
      ensures fresh(Repr - old(Repr))
    {
        incs.data := incs.data + 1;
        value := value + 1;
    }
    
    method Decrement()
      requires Valid()
      modifies Repr
      ensures value == old(value) - 1
      ensures Valid()
      ensures fresh(Repr - old(Repr))
    {
        decs.data := decs.data + 1;
        value := value - 1;
    }

    method Getvalue() returns (v:int)
      requires Valid()
      ensures v == value
      ensures Valid()
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