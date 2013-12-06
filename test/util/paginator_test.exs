defmodule PaginatorTest do
  use ExUnit.Case, async: true

  test "it returns the right query options" do
    assert [ limit: 25, offset: 0 ] == Paginator.build_query_options
    assert [ limit: 25, offset: 0 ] == Paginator.build_query_options(nil, nil)
    assert [ limit: 25, offset: 25 ] == Paginator.build_query_options(2, nil)
    assert [ limit: 50, offset: 0 ] == Paginator.build_query_options(nil, 50)
    assert [ limit: 40, offset: 80 ] == Paginator.build_query_options(3, 40)
  end
end
