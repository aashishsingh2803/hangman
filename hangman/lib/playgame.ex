defmodule Play do
    import Compare_display
    @doc """
  Returns 1 if player wins.
  Returns 0 if player loose.
  """
    def take_input(visited_char) do
        input_char = IO.gets("Enter Character ") |> String.trim

        if is_nil visited_char[input_char] do
            {input_char, Map.put(visited_char, input_char, 1)}
        else
            IO.puts("This character is already inputted")
            take_input(visited_char)
        end
    end

    def play_game(_, _, _, 6, _,_) ,do: 0

    def play_game(hidden_code, guessed_code, pos_not_filled, wrong_try, len, visited_char) 
        when hidden_code == guessed_code do
            1
    end

    def play_game(hidden_code, guessed_code, pos_not_filled, wrong_try, len, visited_char) do

        {input_char, visited_char} = take_input(visited_char)

        new_guessed_code = List.to_string(make_compare(input_char, hidden_code, guessed_code, len))

        if new_guessed_code == guessed_code do

            display(wrong_try + 1, new_guessed_code)
            play_game(hidden_code, guessed_code, pos_not_filled, wrong_try + 1, len, visited_char)
        else
            pos_not_filled = pos_not_filled -- delete_compare(pos_not_filled, input_char, hidden_code)
            if wrong_try != 0 do
                display(wrong_try, new_guessed_code)
            else
                IO.inspect new_guessed_code
            end
            play_game(hidden_code, new_guessed_code, pos_not_filled, wrong_try , len, visited_char)

      end
    end
end