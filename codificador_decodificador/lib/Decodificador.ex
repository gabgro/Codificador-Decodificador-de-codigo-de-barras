defmodule Decodificador do

  def decodificar_banco_e_moeda_(codigo_de_barras) do
    String.slice(codigo_de_barras,0,4)
  end

  def decodificar_data_vencimento(código_de_barras) do
    fator_de_validade = String.slice(codigo_de_barras, 5, 8) |> Integer.parse()
    Date.add(~D[1997-10-7], fator_de_validade)
  end

  def decodificar_valor(código_de_barras) do
    valor = String.slice(codigo_de_barras, 9, 18) |> Float.parse()
    valor/10 |> Float.to_string()
  end
  @moduledoc """
  Documentation for `CodificadorDecodificador`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> CodificadorDecodificador.hello()
      :world

  """

end
