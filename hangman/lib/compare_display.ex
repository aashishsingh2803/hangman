defmodule Compare_display do
	@doc """
  	Returns list of string after comparing with input character
  """
	def make_compare(input_char, hidden_code, guessed_code, len) do

		all_pos = for i<- 0..len - 1 ,do: i
		#IO.inspect(pos_not_filled)
		all_pos
        |> Enum.map( fn(x)-> 
	        if input_char == String.at(hidden_code, x) do 
	            String.at(hidden_code, x)
	        else
	            String.at(guessed_code, x)
	        end
	      end)
	end
	@doc """
  	Returns list of positions which matches the hidden code
  """
	def delete_compare(pos_not_filled ,input_char, hidden_code) do
        IO.inspect (pos_not_filled
        |> Enum.map(fn(x) -> if input_char == String.at(hidden_code, x) ,do: x end)
        |> Enum.filter(fn(x) -> !is_nil(x) end))
	end

	@doc """
	display the hanged man
  """

	def display(0) ,do: nil

	def display(wrong_try, new_guessed_code) do
		IO.inspect(new_guessed_code)
		board = ["     O",
				 "     |",
				 "    /|\\",
				 "   / |\\",
				 "     |",
				 "    / \\"]

		for i<-0..wrong_try-1 do
			IO.puts Enum.at(board, i)
		end

	end
end