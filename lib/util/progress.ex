defmodule Progress do
  def header(text) do
    IO.puts IO.ANSI.red <> text
    IO.write IO.ANSI.reset
  end

  def separate(text) do
    IO.puts ""
    IO.puts IO.ANSI.green <> text
    IO.write IO.ANSI.reset
  end

  def finish do
    IO.puts ""
    IO.ANSI.reset
  end

  def info(text, count) do
    do_info(text, count)
  end

  defp do_info(text, count) when rem(count, 100) == 0 do
    replace_line
    IO.write IO.ANSI.normal <> text
    IO.write IO.ANSI.reset
  end
  defp do_info(_, _), do: nil

  def replace_line do
    IO.write "]\n\033[F\033[J"
    IO.write IO.ANSI.reset
  end
end
