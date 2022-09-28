class Nodo {
  var data: int
  var next: Nodo? //a referência pode ser null, ? indica um tipo anulável

  ghost var TailContent: seq<int>
  ghost var Repr: set<object>

  predicate Valid()
    reads this, Repr
  {
    this in Repr &&
    (next != null ==> next in Repr && next.Repr <= Repr) &&
    (next == null ==> TailContent == []) &&
    (next != null ==> TailContent == [next.data] + next.TailContent)
  }

  constructor ()
    ensures Valid() && fresh(Repr - {this})
    ensures next == null
  {
    next := null;
    TailContent := [];
    Repr := {this};
  }
}

class LinkedList
{
  var cabeca: Nodo;
  var tail: Nodo;
  ghost var Content: seq<int>
  ghost var Espinha: set<Nodo>
  ghost var Repr: set<object>

  predicate Valid()
    reads this, Repr
  {
    this in Repr && Espinha <= Repr &&
    cabeca in Espinha &&
    tail in Espinha &&
    tail.next == null &&
    (forall n :: n in Espinha ==> n.Repr <= Repr && this !in n.Repr &&
                                  n.Valid() &&
                                  (n.next == null ==> n == tail)
    ) &&
    (forall n :: n in Espinha ==> n.next != null ==> n.next in Espinha) &&
    Content == cabeca.TailContent
  }

  constructor ()
    ensures Valid() && fresh(Repr - {this})
    ensures |Content| == 0
  {
    var n := new Nodo();
    cabeca := n;
    tail := n;
    Content := n.TailContent;
    Repr := {this} + n.Repr;
    Espinha := {n};
  }

  method EstaVazio() returns (b:bool)
    requires Valid()
    ensures b <==> |Content| == 0
    ensures Content == old(Content)
    ensures Valid()
  {
    return cabeca == tail;
  }

  method Cabeca() returns (e:int)
    requires Valid()
    requires |Content| > 0
    ensures e == Content[0]
    ensures Valid()
  {
    return cabeca.next.data;
  }

  method Inserir(e:int)
    requires Valid()
    modifies Repr
    ensures Valid() && fresh(Repr - old(Repr))
    ensures Content == old(Content) + [e]
  {
    var n := new Nodo();
    n.data := e;
    tail.next := n;
    tail := n;
    forall m | m in Espinha
    {
      m.TailContent := m.TailContent + [e];
    }
    Content := cabeca.TailContent;
    forall m | m in Espinha
    {
      m.Repr := m.Repr + n.Repr;
    }
    Repr := Repr + n.Repr;
    Espinha := Espinha + {n};
  }
}
