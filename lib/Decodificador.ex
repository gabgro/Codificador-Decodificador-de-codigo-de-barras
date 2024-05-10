defmodule Decodificador do
  def decodificar_banco(codigo_de_barras) do
    codigo_de_barras |> String.slice(0,3)
  end

  def decodificar_moeda(codigo_de_barras) do
    codigo_de_barras |> String.at(3)
  end

  # Função auxiliar para a decodificação da data
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

  def decodificar_campo_livre(codigo_de_barras) do
    cond do
      #Convênio de 7 posições
      codigo_de_barras |> String.slice(19,6) == "000000" ->
        "Numero do convênio: " <> (codigo_de_barras |> String.slice(25,7)) <> "\n" <>
        "Complemento: " <> (codigo_de_barras |> String.slice(32,10)) <> "\n" <>
        "Tipo da carteira/Modalidade da cobrança: " <> (codigo_de_barras |> String.slice(42,2)) <> "\n"
      #17 posições livres
      codigo_de_barras |> String.slice(42,2) == "21" ->
        "Numero do convênio: " <> (codigo_de_barras |> String.slice(19,6)) <> "\n" <>
        "Número livre: " <> (codigo_de_barras |> String.slice(25,17)) <> "\n"
      #Convênio de 4 posições
      true ->
        "Numero do convênio: " <> (codigo_de_barras |> String.slice(19,4)) <> "\n" <>
        "Complemento: " <> (codigo_de_barras |> String.slice(23,7)) <> "\n" <>
        "Número da agência: " <> (codigo_de_barras |> String.slice(30,4)) <> "\n" <>
        "Conta corrente: " <> (codigo_de_barras |> String.slice(34,8)) <> "\n" <>
        "Tipo da carteira/Modalidade da cobrança: " <> (codigo_de_barras |> String.slice(42,2)) <> "\n"
    end
  end

  def decodificar_linha_digitavel(codigo_de_barras) do
    Codificador.codificar_linha_digitavel(codigo_de_barras) # Basta chamar a função do codificador
  end

  # A lista de saida vai estar organizado de acordo com o enunciado da tarefa 2
  def saida_decodificador(lista) do
    # A saída será escrita como String
  "Linha Digitável: " <> Enum.at(lista, 5) <> "\n" <>
  "Código do Banco: " <> Enum.at(lista, 0) <> "\n" <>
  "Código da Moeda: " <> Enum.at(lista, 1) <> "\n" <>
  "Data de Vencimento: " <> Enum.at(lista, 2) <> "\n" <>
  "Valor: " <> Enum.at(lista, 3) <> "\n" <>
  Enum.at(lista, 4) <> "\n"
  end

  def decodificar(codigo_de_barras) do
    # Remove possíveis caracteres lixo
    codigo_de_barras = codigo_de_barras |> String.replace([".", ",", "-"], "")
    # Captura os dados da decodifição
    banco = codigo_de_barras |> decodificar_banco()
    moeda = codigo_de_barras |> decodificar_moeda()
    data = codigo_de_barras |> decodificar_data_vencimento()
    valor = codigo_de_barras |> decodificar_valor()
    campo_livre = codigo_de_barras |> decodificar_campo_livre()
    linha_digitavel = codigo_de_barras |> decodificar_linha_digitavel()
    # Chama a função IO
    saida_decodificador([banco, moeda, data, valor, campo_livre, linha_digitavel]) |> IO.puts()
  end

end
