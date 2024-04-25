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

  # Transdorma uma String em uma lista
  def stringToList(string) do
    for<<x::binary-1 <- string>>, do: x
  end

  # Multiplica cada elemento da lista com base no valor do parametro numero
  def alternar([h|l],numero) when numero == 1 do
    [h|alternar(l,2)]
  end

  def alternar([h|l],numero) when numero == 2 do
    # Quando h é maior que 4 o resultado da multiplicação por 2 é maior ou igual a 10, necessitando de um cálculo diferente
    if h > 4 do
      resultado = h*2
      |>Integer.to_string()
      |>stringToList()
      |>Enum.map(fn x -> String.to_integer(x) end)
      |>Enum.reduce(0,fn x,y -> x+y end)
      [resultado|alternar(l,1)]
    else
      [h*2|alternar(l,1)]
    end
  end

  # Critério de parada da função alternar
  def alternar([], _) do
    []
  end

  # Recebe uma String e um inteiro que sinaliza em que campo aquela String se refere
  # Retorna o dv do campo no formato interiro
  def digitoVerificadorLinha(linha,campo) when campo == 1 do
    resultado = linha
    |>stringToList()
    |>Enum.map(fn x -> String.to_integer(x) end)
    |>alternar(2)
    |>Enum.reduce(0,fn x,y -> x+y end)
    |>rem(10)
    10 - resultado
  end

  # Cálculo dos campo 2 e 3 funcionam da mesma forma, então nesse caso a especificação do campo é irrelevante
  def digitoVerificadorLinha(linha,_) do
    resultado = linha
    |>stringToList()
    |>Enum.map(fn x -> String.to_integer(x) end)
    |>alternar(1)
    |>Enum.reduce(0,fn x,y -> x+y end)
    |>rem(10)
    10-resultado
  end

  # def soma_dv(codigo, peso_atual \\ 9) do
  #   digito_atual = codigo |> String.last() |> String.to_integer()
  #   (digito_atual * peso_atual) + soma_dv(String.slice(codigo, 0, String.length(codigo) - 1), peso_atual)
  # end
  # def soma_dv(codigo, peso_atual) when peso_atual == 2 do
  #   digito_atual = codigo |> String.last() |> String.to_integer()
  #   (digito_atual * peso_atual) + soma_dv(String.slice(codigo, 0, String.length(codigo) - 1), 2)
  # end

  # def calcular_dv_codigo_de_barras(codigo_sem_dv, peso_atual \\ 2) do

  # end



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
