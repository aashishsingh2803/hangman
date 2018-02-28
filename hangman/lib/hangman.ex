defmodule Hangman do
  use Application

  def start(_types,_args) do
    Supervisor_parent.start_link
  end
end