defmodule FiQLTest do

  use ExUnit.Case

  doctest FiQL,
    async: true

  test "simple querying" do
    result = FiQL.compile("user:id==\"1\"")
    assert result == {:ok, {{:lookup_eq, 1, '=='}, {:selector, 1, 'user:id'}, {:value, 1, '"1"'}}}
  end

  test "or operator" do
    result = FiQL.compile("username==\"ertgl\",username==\"krcgk\"")
    assert result == {:ok,
      {{:op_or, 1, ','},
      {{:lookup_eq, 1, '=='}, {:selector, 1, 'username'}, {:value, 1, '"ertgl"'}},
      {{:lookup_eq, 1, '=='}, {:selector, 1, 'username'}, {:value, 1, '"krcgk"'}}}}
  end

  test "and operator" do
    result = FiQL.compile("username==\"ertgl\";username==\"yusufkaracin\"")
    assert result == {:ok,
      {{:op_and, 1, ';'},
      {{:lookup_eq, 1, '=='}, {:selector, 1, 'username'}, {:value, 1, '"ertgl"'}},
      {{:lookup_eq, 1, '=='}, {:selector, 1, 'username'}, {:value, 1, '"yusufkaracin"'}}}}
  end

  test "nested query" do
    result = FiQL.compile("username==\"ertgl\";(username==\"krcgk\",username==\"yusufkaracin\")")
    assert result == {:ok,
      {{:op_and, 1, ';'},
      {{:lookup_eq, 1, '=='}, {:selector, 1, 'username'}, {:value, 1, '"ertgl"'}},
      {{:op_or, 1, ','},
        {{:lookup_eq, 1, '=='}, {:selector, 1, 'username'}, {:value, 1, '"krcgk"'}},
        {{:lookup_eq, 1, '=='}, {:selector, 1, 'username'},
        {:value, 1, '"yusufkaracin"'}}}}}
  end

end
