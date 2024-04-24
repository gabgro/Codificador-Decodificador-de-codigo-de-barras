defmodule DecodificadorTest do
  use ExUnit.Case
  doctest Decodificador

  test "Data de Vencimento 1" do
    assert DeDecodificador.decodificar_data_vencimento("001 9 337370000000100 05009 401448 16060680935031") == 1001
  end
  test "Data de Vencimento 2" do
  assert Decodificador.decodificar_data_vencimento("01/05/2002") == 1667
  end
  test "Data de Vencimento 3" do
  assert DeDecodificador.decodificar_data_vencimento("21/02/2025") == 9999
  end
  test "Data de Vencimento 4" do
  assert DeDecodificador.decodificar_data_vencimento("22/02/2025") == 1000
  end
  test "Data de Vencimento 5" do
  assert DeDecodificador.decodificar_data_vencimento("23/02/2025") == 1001
  end

  test "Valor 1 (string)" do
    assert Decodificador.decodificar_valor("0000020000") ==  "200.00"
  end
  test "Valor 2 (string)" do
    assert Decodificador.decodificar_valor("0000020012") ==  "200.12"
  end
  test "Valor 3 (string)" do
    assert Decodificador.decodificar_valor("0000020012") == "20012"
  end
  test "Valor 4 (string)" do
    assert Decodificador.decodificar_valor("0000200012") == "2000.12"
  end
  test "Valor 5 (string)" do
    assert Decodificador.decodificar_valor("0002000012") == "20000.12"
  end
end
