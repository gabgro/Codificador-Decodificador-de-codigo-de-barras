defmodule CodificadorDecodificador do
  import Codificador
  import Decodificador

  def saida_codificador(lista) do
    # Abre uma stream que recebera as strings
    stream = StringIO.open("w")
    IO.write(stream, "Código de Barras: " <> Enum.at(lista, 0) <> "\n")
    IO.write(stream, "Linha Digitável: " <> Enum.at(lista, 1) <> "\n")
    StringIO.close(stream)
    saida = StringIO.to_string(stream)
    IO.puts(saida)
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


  def executar(caminho \\ "../test/test_file.txt") do
    texto = caminho |> File.read |> elem(1)
    |> String.split("\n")
    operacao = texto |> Enum.at(0) |> String.downcase
    if operacao in ["codificar", "codificação", "codifique"] do
      texto |> List.delete_at(0) |> Codificador.codificar |> saida_codificador
    else
      texto |> List.delete_at(0) |> Decodificador.decodificar |> saida_decodificador
    end
  end
end
