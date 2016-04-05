defmodule ElixirChat.Room do
	@doc """
	Starts the chat room
	"""
	def start_link do
		Agent.start_link(fn -> [] end)
	end

end