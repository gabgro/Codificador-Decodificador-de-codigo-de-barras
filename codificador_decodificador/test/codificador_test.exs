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

  test "Valor 1 (string)" do
    assert Codificador.codificar_valor("R$ 200.00") == "0000020000"
  end
  test "Valor 2 (string)" do
    assert Codificador.codificar_valor("R$200.00") == "0000020000"
  end
  test "Valor 3 (string)" do
    assert Codificador.codificar_valor("200.00") == "0000020000"
  end
  test "Valor 4 (string)" do
    assert Codificador.codificar_valor("R$ 200.12") == "0000020012"
  end
  test "Valor 5 (string)" do
    assert Codificador.codificar_valor("R$ 20012") == "0000020012"
  end
  test "Valor 6 (string)" do
    assert Codificador.codificar_valor("R$ 2000.12") == "0000200012"
  end
  test "Valor 7 (string)" do
    assert Codificador.codificar_valor("R$ 20000.12") == "0002000012"
  end
end
