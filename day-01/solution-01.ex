{:ok, contents} = File.read("input.txt")

part_1 = contents 
|> String.split("\n\n")
|> Enum.reduce(0, fn calories_as_string, acc -> 
    calories_as_string
    |> String.split("\n")
    |> Enum.reduce(0, fn calories, acc ->
        calories 
        |> Integer.parse 
        |> elem(0)
        |> Kernel.+(acc)
    end)
    |> max(acc)
end)

IO.inspect(part_1)

part_2 = contents 
|> String.split("\n\n")
|> Enum.reduce([], fn calories_as_string, acc -> 
    calories_as_string
    |> String.split("\n")
    |> Enum.reduce(0, fn calories, acc ->
        calories 
        |> Integer.parse 
        |> elem(0)
        |> Kernel.+(acc)
    end)
    |> (fn (input) -> [input] end).()
    |> Kernel.++(acc)
end)
|> Enum.sort
|> Enum.take(-3)
|> Enum.reduce(0, fn calories, acc -> 
    calories
    |> Kernel.+(acc)
end)

IO.inspect(part_2)
