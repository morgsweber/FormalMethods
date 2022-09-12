// the implementation of the abstract data type Set through the concrete implementation using ARRAYs.
class S {
  var s: set<int>;
  //var a: new array<int>;

  // Constructor must instantiate an empty set
  method S() returns ()
  {  }

  // Add a new element to the set and return true if added, and return false if the element is already in the set.
  method Add(element: int) returns (b: bool)
  {  }

  // Remove an element from the set and return true if removed, and return false if the element was not in the set.
  method Remove(element: int) returns (b: bool)
  {  }

  // Check if a certain element belongs or not to a set.
  method Belongs(element: int) returns (b: bool)
  {
    //b := element in this.s[..];
  }

  // Return the number of elements in the set.
  method Size() returns (l: int)
  {
    //l := this.s.Length;
  }

  // Check if a set is empty or not.
  method IsEmpty() returns (b: bool)
  {
    b := this.s == {};
  }

  // Perform the union of two sets returning a new set as a result, without changing the original sets.
  method Union(s1: set, s2: set) returns (sr: set)
  {
    sr := s1 + s2;
  }
}

method Main()
{
    var test := new S;
}