# defmodule CodificadorDecodificador do
#   import Codificador
#   import Decodificador






#   def executar(caminho ) do
#     texto = caminho |> File.read |> elem(1)
#     |> String.split("\n")
#     operacao = texto |> Enum.at(0) |> String.downcase
#     if operacao in ["Codificador", "codificar", "codificação", "codifique"] do
#       texto |> List.delete_at(0) |> Codificador.codificar |> saida_codificador
#     else
#       texto |> List.delete_at(0) |> Decodificador.decodificar |> saida_decodificador
#     end
#   end
# end
