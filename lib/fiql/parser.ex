defmodule FiQL.Parser do

  @spec parse(list()) :: any()
  def parse(tokens)
  when is_list(tokens)
  do
    :fiql_parser.parse(tokens)
  end

end
