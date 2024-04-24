defmodule Decodificador do

  def decodificar_banco(codigo_de_barras) do
    String.slice(codigo_de_barras,0,3)
  end

  def decodificar_moeda(codigo_de_barras) do
    String.at(codigo_de_barras,3)
  end

  def decodificar_data_vencimento(codigo_de_barras) do
    fator_de_validade = String.slice(codigo_de_barras, 5, 4) |> String.to_integer()
    Date.add(~D[1997-10-07], fator_de_validade)
  end

  def decodificar_valor(codigo_de_barras) do
    valor = String.slice(codigo_de_barras, 9, 10) |> String.replace_leading("0", "")
    strs = valor |> String.split_at(-2)
    str1 = elem(strs,0)
    str2 = elem(strs,1)
    str1 <> "." <> str2
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
