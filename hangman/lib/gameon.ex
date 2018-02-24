defmodule Gameon do
	use GenServer

	def start_link do
		GenServer.start_link(__MODULE__, [])
	end

	def start_cast(receiver_pid) do
		GenServer.cast(receiver_pid, {:hanged})
	end

	def handle_cast({:hanged}, state) do
		IO.inspect Data_parse.dead_or_alive
		{:noreply, state}
	end

end