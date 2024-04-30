defmodule DecodificadorTest do
  use ExUnit.Case
  doctest Decodificador

  test "Data de Vencimento" do
    assert Decodificador.decodificar_data_vencimento("00193373700000001000500940144816060680935031") == "31/12/2007"
  end
  test "Valor" do
    assert Decodificador.decodificar_valor("00193373700000001000500940144816060680935031") ==  "1.00"
  end
  test "Codigo do banco" do
    assert Decodificador.decodificar_banco("00193373700000001000500940144816060680935031")  == "001"
  end
  test "Moeda" do
    assert Decodificador.decodificar_moeda("00193373700000001000500940144816060680935031") == "9"
  end
end
