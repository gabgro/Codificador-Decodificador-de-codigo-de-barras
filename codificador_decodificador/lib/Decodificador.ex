defmodule Decodificador do
  import Codificador
  def decodificar_banco(codigo_de_barras) do
    codigo_de_barras |> String.slice(0,3)
  end

  def decodificar_moeda(codigo_de_barras) do
    codigo_de_barras |> String.at(3)
  end

  defp converter_data_string(data) do
    data |> Date.to_string |> String.split("-") |>  Enum.reverse |>
    List.insert_at(1, "/") |> List.insert_at(3, "/") |> List.to_string
  end
  def decodificar_data_vencimento(codigo_de_barras) do
    fator_de_validade = String.slice(codigo_de_barras, 5, 4) |> String.to_integer()
    Date.add(~D[1997-10-07], fator_de_validade) |> converter_data_string()
  end

  def decodificar_valor(codigo_de_barras) do
    valor = String.slice(codigo_de_barras, 9, 10) |> String.replace_leading("0", "")
    strs = valor |> String.split_at(-2)
    str1 = elem(strs,0)
    str2 = elem(strs,1)
    str1 <> "." <> str2
  end

  # Não parece ser possivel decodificar as informacoes separadamente (conta corrente etc)
  # pois não há como saber o tipo de convenio
  def decodificar_campo_livre(codigo_de_barras) do
    codigo_de_barras |> String.slice(19, 25)
  end

  def decodificar_linha_digitavel(codigo_de_barras) do
    Codificador.codificar_linha_digitavel(codigo_de_barras)
  end


  # A lista de saida vai estar organizado de acordo com o enunciado da tarefa 2
  def saida_decodificador(lista) do
    # Abre uma stream que recebera as strings
    stream = StringIO.open("w")
    IO.write(stream, "Linha Digitável: " <> Enum.at(lista, 0) <> "\n")
    IO.write(stream, "Código do Banco: " <> Enum.at(lista, 1) <> "\n")
    IO.write(stream, "Código da Moeda: " <> Enum.at(lista, 2) <> "\n")
    IO.write(stream, "Data de Nascimento: " <> Enum.at(lista, 3) <> "\n")
    IO.write(stream, "Valor: " <> Enum.at(lista, 4) <> "\n")
    IO.write(stream, "Nosso Número (contendo número do convênio, número da conta etc): " <>
    Enum.at(lista, 5) <> "\n")
    StringIO.close(stream)
    saida = StringIO.to_string(stream)
    IO.puts(saida)
  end

  def decodificar(codigo_de_barras) do
    # Formata o código de barras
    codigo_de_barras = codigo_de_barras |> String.replace([".", ",", "-"], "")
    # Captura os dados da decodifição
    banco = codigo_de_barras |> decodificar_banco()
    moeda = codigo_de_barras |> decodificar_moeda()
    data = codigo_de_barras |> decodificar_data_vencimento()
    valor = codigo_de_barras |> decodificar_valor()
    campo_livre = codigo_de_barras |> decodificar_campo_livre()
    linha_digitavel = codigo_de_barras |> decodificar_linha_digitavel()
    # Chama a função IO
    saida_decodificador([banco, moeda, data, valor, campo_livre, linha_digitavel])
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
