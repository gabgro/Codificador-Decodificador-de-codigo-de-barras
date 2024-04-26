defmodule CodificadorTest do
  use ExUnit.Case
  doctest Codificador

  test "Fator de Vencimento 1" do
    assert Codificador.codificar_data_vencimento("04/07/2000") == 1001
  end
  test "Fator de Vencimento 2" do
  assert Codificador.codificar_data_vencimento("01/05/2002") == 1667
  end
  test "Fator de Vencimento 3" do
  assert Codificador.codificar_data_vencimento("21/02/2025") == 9999
  end
  test "Fator de Vencimento 4" do
  assert Codificador.codificar_data_vencimento("22/02/2025") == 1000
  end
  test "Fator de Vencimento 5" do
  assert Codificador.codificar_data_vencimento("23/02/2025") == 1001
  end

  test "Valor 1" do
    assert Codificador.codificar_valor("R$ 200.00") == "0000020000"
  end
  test "Valor 2" do
    assert Codificador.codificar_valor("R$200.00") == "0000020000"
  end
  test "Valor 3" do
    assert Codificador.codificar_valor("200.00") == "0000020000"
  end
  test "Valor 4" do
    assert Codificador.codificar_valor("R$ 200.12") == "0000020012"
  end
  test "Valor 5" do
    assert Codificador.codificar_valor("R$ 20012") == "0000020012"
  end
  test "Valor 6" do
    assert Codificador.codificar_valor("R$ 2000.12") == "0000200012"
  end
  test "Valor 7" do
    assert Codificador.codificar_valor("R$ 20000.12") == "0002000012"
  end

  test "DV do código de barras" do
    assert Codificador.calcular_dv_codigo_de_barras("0019373700000001000500940144816060680935031") == "00193373700000001000500940144816060680935031"
  end

  test "Linha Digitável" do
    assert Codificador.codificar_linha_digitavel("00193373700000001000500940144816060680935031") == "00190500954014481606906809350314337370000000100"
  end
end
