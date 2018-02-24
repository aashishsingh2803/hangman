defmodule Hangman do
  use Application

  def start_game do
    Supervisor_parent.start_link
  end
end