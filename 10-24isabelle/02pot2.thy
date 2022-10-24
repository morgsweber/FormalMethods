theory Examplo
    imports Main
begin

    primrec pot2 :: "nat => nat => nat" where 
        eq1: "pot2 0 = 1"                       (*eq1 eh apenas uma label para referenciar na prova*)
        eq2: "pot2 (Suc n) = 2 * pot2 n"

    value "pot2 3"

    theorem pot2ok: "pot2 n = 2^n"
    proof (induction n)
        show "pot2 0 = 2^0" (*por eq1*)
        proof - (* - significa que não vai usar nenhuma prova especifica*)
            have "pot2 0 = 1" by (simp only: eq1)
            also have "... = 2^0" by (algebra)     (*por aritimetica/algebra*)
            finally show "pot2 0 = 2^0" by (simp)
    qed
    next 

end