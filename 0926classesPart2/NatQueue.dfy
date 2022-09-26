class {:autocontracts}  NatQueue
{
    //Implementação
    var a: array<nat>;
    var tail: nat;
    const max: nat;
    //Abstração
    ghost var Contents: seq<nat>;
    ghost const MaxSize: nat;

    //Invariante de classe
    predicate Valid()
    {
        max > 0
        && a.Length == max
        && 0 <= tail <= max
        && Contents == a[0..tail]
        && MaxSize == max
    }

    constructor (m:nat)
      requires m > 0
      ensures MaxSize == m
      ensures Contents == []
    {
        max := m;
        a := new nat[m];
        tail := 0;
        Contents := [];
        MaxSize := max;
    }

    method MaxQuantity() returns (n:nat)
      ensures n == MaxSize
      ensures Contents == old(Contents)
    {
        return max;
    }

    method Quantity() returns (n:nat)
      ensures n == |Contents|
      ensures Contents == old(Contents)
    {
        return tail;
    }

    method ToQueue(e:nat)
      requires |Contents| < MaxSize
      ensures Contents == old(Contents) + [e]
    {
        a[tail] := e;
        tail := tail + 1;
        Contents := Contents + [e];
    }

    method Unqueue() returns (e:nat)
      requires |Contents| > 0
      ensures e == old(Contents)[0]
      ensures Contents == old(Contents)[1..]
    {
        e := a[0];
        tail := tail - 1;
        forall i | 0 <= i < tail
        {
            a[i] := a[i+1];
        }
        Contents := a[0..tail];
    }
}

method Main()
{
    var queue := new NatQueue(5);
    queue.ToQueue(1);
    queue.ToQueue(2);
    assert queue.Contents == [1,2];
    var q := queue.Quantity();
    assert q == 2;
    var e := queue.Unqueue();
    assert e == 1;
    assert queue.Contents == [2];
}










