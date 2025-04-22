package br.edu.ifsc.fln.domain;

public class ContaInvestimento extends Conta {

    public ContaInvestimento(String tipoCliente, String dataAbertura, double saldo) {
        super("Investimento", tipoCliente, dataAbertura, saldo);
    }

    @Override
    public double calcularValorTarifaManutencao() {
        return 10.0;
    }
}