defmodule ElixirChat.Room do
	@doc """
	Starts the chat room
	"""
	def start_link do
		Agent.start_link(fn -> [] end)
	end

	def join_room(room, client) do
		Agent.update(room, fn(clients) ->
			cond do
				Enum.any?(clients, &(&1 == client)) -> clients
				true -> clients ++ [client]
			end
		end)
	end

	def leave_room(room, client) do
		Agent.update(room, fn(clients) ->
			cond do
				Enum.any?(clients, &(&1 == client)) -> Enum.filter(clients, &(&1 != client)).to_list
				true -> clients
			end
		end)
	end
end