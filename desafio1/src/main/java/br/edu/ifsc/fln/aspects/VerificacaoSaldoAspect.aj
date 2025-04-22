package br.edu.ifsc.fln.aspect;

import domain.Conta;

public aspect VerificacaoSaldoAspect {

    // Pointcut que intercepta qualquer execução do método sacar em qualquer subclasse de Conta
    pointcut chamadaDeSaque(Conta c, double valor):
        execution(void domain.Conta+.sacar(double)) && this(c) && args(valor);

    // Advice que roda ANTES da execução do saque
    before(Conta c, double valor): chamadaDeSaque(c, valor) {
        if (c.getSaldo() < valor) {
            System.out.println("[LOG DE ERRO] Saldo insuficiente para saque na conta do tipo "
                + c.getTipoConta() + ". Saldo atual: R$" + c.getSaldo() + ", valor solicitado: R$" + valor);

            // Impede o saque (skip do método original)
            throw new RuntimeException("Operação cancelada: saldo insuficiente.");
        }
    }
}