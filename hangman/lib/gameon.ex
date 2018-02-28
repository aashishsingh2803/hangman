defmodule Gameon do
	use GenServer

	def start_link do
		GenServer.start_link(__MODULE__, [], name: :s)
	end

	def start_cast() do
		GenServer.cast(:s, {:hanged})
	end

	def handle_cast({:hanged}, state) do
		Data_parse.dead_or_alive
		{:noreply, state}
	end

end