# Codificador/Decodificador de código de barras

Esta é a implementação em Elixir da Tarefa 2, feita por Gabriel Rodrigues de Oliveira e Samuel Morais da Rocha e Silva.

## Uso
Este projeto conta com dois módulos: **Codificador** e **Decodificador**.

 **Codificador:** <br>
 O módulo **Codificador** conta com a função pública `codificar`, que recebe os dados especificados no relatório como entrada e retornará o código de barras gerado, tal como sua respectiva linha digitável.

A entrada para a função `Codificador.codificar` pode ser uma lista contendo os dados de entrada na ordem estabelecida ou um caminho para um arquivo `.txt`,  tal que este contenha todos os dados separados por quebra de linhas. O arquivo [`codificador_file.txt`](codificador_file.txt) está declarado como o parâmetro padrão da função, logo, caso seja chamada sem argumentos, ele será lido como entrada. Portanto, caso queira, é possível mudar a entrada do programa apenas alterando o conteúdo deste arquivo.
Exemplos:
```
iex(1)> Codificador.codificar()  # Chamada tomando o arquivo padrão como entrada

iex(2)> Codificador.codificar("/meu_diretorio/meu_arquivo")  # Chamada tomando um arquivo do usuário como entrada

iex(3)> Codificador.codificar(["001", "9", "31/12/2007", "1.00", "0500",
    "9401448", "1606", "06809350", "31"])  # Chamada tomando uma lista contendo as informações como entrada
```
**Decodificador**: <br>
A função `Decodificador.decodificar` recebe como entrada apenas uma String referente ao código de barras que será decodificado:
```
iex(1)> Decodificador.decodificar("00193373700000001000500940144816060680935031")  # Chamada tomando o arquivo padrão como entrada
```

## Instalação

* Clone este repositório na sua máquina. Pode ser feito com o comando:
  ```
  $ git clone https://github.com/gabgro/Codificador-Decodificador-de-codigo-de-barras.git
  ```
* Dentro do diretório raiz do projeto, aquele com o arquivo `mix.exs`, insira o comando:
  ```
  $ mix deps.get
  ```
  Para instalar as dependências necessárias.

* Para compilar o projeto, use o comando 
``$ mix``
Caso queira executar os teste íncluidos no diretório ``/test``, use o comando:
  ```
  $ mix test
  ```
  Caso queira abrir e usar os módulos no ambiente iEX, pode-se usar o comando:
    ```
    $ iex -S mix
    ```
  Com isso, os módulos Codificador e Decodificador estarão disponíveis.