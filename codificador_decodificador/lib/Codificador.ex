defmodule Codificador do

  def codificar_data_vencimento(data_str) do
    # Converte em um objeto do tipo Date
    data_lista = data_str |> String.split("/") |> Enum.map(&String.to_integer/1)
    data_entrada = Date.new(Enum.at(data_lista,2), Enum.at(data_lista,1), Enum.at(data_lista,0)) |>
    elem(1)
    # Data base
    data_base = Date.new(1997,10,7) |> elem(1)
    # Calcula o fator de vencimento
    fator_de_validade = Date.diff(data_entrada, data_base)
    if (fator_de_validade > 9999) do
      1000 + rem(fator_de_validade, 1000) # Reinicia a contagem do fator
    else
      fator_de_validade
    end
  end


  # A entrada deve ser do tipo String
  def codificar_valor(valor_string) do
    # Caso o número fornecido não tenha casas decimais, adicionamos ".00" ao fim da string
    if !String.contains?(valor_string, [".", ","]) do
      String.pad_trailing(valor_string, String.length(valor_string) + 3, ".00")
    end
    # Converte valor em string e remove o "."
    valor =  valor_string |> String.replace(["R$", "$", ".", ",", " "], "")
    String.pad_leading(valor, 10,"0")
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




  # def assembler(, dv)
end
