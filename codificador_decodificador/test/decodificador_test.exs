defmodule DecodificadorTest do
  use ExUnit.Case
  doctest Decodificador

  test "Banco 1" do
    assert Decodificador.decodificar_banco("00193373700000001000500940144816060680935031") == "001"
  end

  test "Moeda 1" do
    assert Decodificador.decodificar_moeda("00193373700000001000500940144816060680935031") == "9"
  end

  test "Data de Vencimento 1" do
    assert Decodificador.decodificar_data_vencimento("00193373700000001000500940144816060680935031") == ~D[2007-12-31]
  end
  test "Valor 1 (string)" do
    assert Decodificador.decodificar_valor("00193373700000001000500940144816060680935031") ==  "1.00"
  end
  # test "Valor 2 (string)" do
  #   assert Decodificador.decodificar_valor("0000020012") ==  "200.12"
  # end
  # test "Valor 3 (string)" do
  #   assert Decodificador.decodificar_valor("0000020012") == "20012"
  # end
  # test "Valor 4 (string)" do
  #   assert Decodificador.decodificar_valor("0000200012") == "2000.12"
  # end
  # test "Valor 5 (string)" do
  #   assert Decodificador.decodificar_valor("0002000012") == "20000.12"
  # end
end
