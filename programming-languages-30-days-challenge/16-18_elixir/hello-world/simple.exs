IO.puts "Hello World from Elixir"
IO.puts 10 / 2
IO.puts div 10, 2
IO.puts rem 10, 2
IO.puts round(3.58)
IO.puts trunc(3.58)
IO.puts :hello #ATOM
IO.puts "hellö #{:world}"
IO.puts byte_size("hellö")
IO.puts String.length("hellö")
IO.puts String.upcase("hellö")

add = fn a, b -> a + b end
IO.puts add.(1, 2)

double = fn a -> add.(a, a) end
IO.puts double.(2)

# IO.puts ([1, 2, 3] ++ [4, 5, 6])
# IO.puts ([1, true, 2, false, 3, true] -- [true, false])

list = [1, 2, 3]
IO.puts hd list
# IO.puts tl list

# IO.puts {:ok, "hello"}
{a, b, c} = {:hello, "world", 42}
IO.puts a
IO.puts b
IO.puts c

case {1,2,3} do
    {4,5,6} ->
        IO.puts "This clause won't match"
    {1, x, 3} ->
        IO.puts "This clause will match and bind x to 2 in this clause"
    _ ->
        IO.puts "This clause would match any value"
end

x = 1
case 10 do
    ^x -> IO.puts "Won't match"
    _  -> IO.puts "This clause would match any value"
end
