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
end
