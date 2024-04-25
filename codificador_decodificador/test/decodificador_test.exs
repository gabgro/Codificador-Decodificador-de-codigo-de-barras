defmodule DecodificadorTest do
  use ExUnit.Case
  doctest Decodificador

  test "Data de Vencimento 1" do
    assert Decodificador.decodificar_data_vencimento("00193373700000001000500940144816060680935031") == ~D[2007-12-31]
  end
  test "Valor 1 (string)" do
    assert Decodificador.decodificar_valor("00193373700000001000500940144816060680935031") ==  "1.00"
  end

end
