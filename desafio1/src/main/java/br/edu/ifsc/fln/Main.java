package br.edu.ifsc.fln;

import br.edu.ifsc.fln.domain.Conta;
import br.edu.ifsc.fln.domain.ContaPoupanca;

public class Main {
    public static void main(String[] args) {
        Conta conta = new ContaPoupanca("Cliente1", "2023-01-01", 100.0);

        conta.depositar(50); // OK
        conta.sacar(120);    // Deve funcionar
        conta.sacar(200);    // Deve gerar log de erro e lançar exceção
    }
}