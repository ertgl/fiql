defmodule FiQL.Lexer do

  @spec lex(bitstring()) :: {:ok, list(), integer()} | {:error, any()}
  def lex(query) do
    query
    |> to_charlist()
    |> :fiql_lexer.string()
  end

end
