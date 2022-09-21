class Counter
{
    //campo
    var value: int;

    //método
    method Incrementa()
      modifies this //indica que todos os campos podem ser modificados
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

    method Getvalue() returns (v:int)
      ensures v == value
    {
        return value;
    }
}

method Main()
{
    var c := new Counter; //create a new object on heap
    var v := c.Getvalue();
    assert v == 0; // this assert is false, because this not start with 0
    c.Incrementa();
    v := c.Getvalue();
    assert v == 1;
    c.Decrementa();
    v := c.Getvalue();
    assert v == 0;
}