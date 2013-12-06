defmodule Paginator do
  @default_per_page 25
  @default_page 1

  def build_query_options(page // @default_page, per_page // @default_per_page) do
    limit = calculate_limit(per_page)
    offset = calculate_offset(page, limit)
    [ limit: limit, offset: offset ]
  end

  defp calculate_limit(nil), do: @default_per_page
  defp calculate_limit(per_page), do: per_page

  defp calculate_offset(nil, _), do: 0
  defp calculate_offset(page, limit) do
    (page - 1) * limit
  end
end
