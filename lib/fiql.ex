defmodule FiQL do
  @moduledoc File.read!("README.md")

  @doc ~S"""
  Compiles given bitstring query, returns a tree of tuples.
  """
  @spec compile(bitstring()) :: any()
  def compile(query)
  when is_bitstring(query)
  do
    with {:ok, tokens, _line} <- FiQL.Lexer.lex(query) do
      with {:ok, tree, _line} <- FiQL.Parser.parse(tokens) do
        tree
      end
    end
  end

end
