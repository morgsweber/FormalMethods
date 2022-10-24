theory Examplo
    imports Main
begin

    primrec soma :: "nat => nat => nat"
    where "soma n 0 = n"
          "soma n (Suc x) = Suc (soma n m)"
    
    value "soma 1 2" (*para testar*)

    theorem somazero: "soma n 0 = n"
        apply (induction n)
        apply (auto)
    done

    theorem somazerov2: "soma n 0 = n" (*provando passo a passo*)
    proof (induction n)
        show "soma 0 0 = 0" by (simp) (*simplific*)
    next
        fix x::nat
        assume hipotese: "soma x 0 = x"
        show "soma (Suc x) 0 = Suc x" by (simp)
    qed

end