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

IO.inspect ([1, 2, 3] ++ [4, 5, 6])
IO.inspect ([1, true, 2, false, 3, true] -- [true, false])

list = [1, 2, 3]
IO.inspect hd list
IO.inspect tl list

IO.inspect {:ok, "hello"}
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

# x = 1
# case 10 do
#     ^x -> IO.puts "Won't match"
#     _  -> IO.puts "This clause would match any value"
# end

keywordsList = [{:a, 1}, {:b, 2}]
IO.inspect keywordsList

IO.inspect %{:a => 1, 2 => :b}
n = 1
IO.inspect %{n => :one}
IO.inspect Map.get(%{:a => 1, 2 => :b}, :a)
IO.inspect Map.put(%{:a => 1, 2 => :b}, :c, 3)
IO.inspect Map.to_list(%{:a => 1, 2 => :b})

users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]
IO.puts users[:john].age
users = put_in users[:john].age, 31
IO.puts users[:john].age

users = update_in users[:mary].languages, fn languages -> List.delete(languages, "Clojure") end
IO.inspect users
