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
  test "Decodificar" do
    assert Decodificador.decodificar("00193373700000001000500940144816060680935031") ==
    "Linha Digitável: " <> "00190500954014481606906809350314337370000000100" <> "\n" <>
    "Código do Banco: " <> "001" <> "\n" <>
    "Código da Moeda: " <> "9" <> "\n" <>
    "Data de Vencimento: " <> "31/12/2007" <> "\n" <>
    "Valor: " <> "1.00" <> "\n" <>
    "Campo Livre (contendo número do convênio, número da conta etc): " <>
    "0500940144816060680935031" <> "\n"

  end
end
