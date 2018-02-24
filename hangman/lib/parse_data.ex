defmodule Data_parse do
    import Play
    @doc """
  	starts the game
  """
	def dead_or_alive do
		hidden_code = random_word()
		len = String.length(hidden_code)
		#initially guessed_code = "------.."
	    guessed_code = for i<-0..len - 1 ,do: "-"
	    guessed_code = guessed_code |> List.to_string

	    #initially pos_not_filled = [0,1,2,3,4,5,..]
	    pos_not_filled  = for i<-0..len - 1 ,do: i
	    #initially there in no input character so map is empty
	    visited_char = %{}

	    IO.inspect "Start Game"
	    if play_game(hidden_code, guessed_code, pos_not_filled, 0, len, visited_char) == 1 do
	    	IO.puts("You win")
	    	IO.puts("You know what the code is #{hidden_code}")
	    else
	    	IO.puts("You Lose")
	    	IO.puts("Real code is #{hidden_code}")
	    end

	end
 	@doc """
  	Load file content and returns random word
  """
 	defp random_word() do
 		{:ok, words} = File.read("/home/allenite/hangman/lib/words.txt")

 		list_word = words |> String.split("\n")
 		list_word
        |> Enum.at( :rand.uniform(length(list_word) - 1))
 	end
end

#IO.inspect Data_parse.load_file("AASHISH")