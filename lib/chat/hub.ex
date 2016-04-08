defmodule ElixirChat.Hub do
	
	def start_link do
		Agent.start_link(fn -> %{} end)
	end

	def get_room(hub, name) do
		Agent.get(hub, &Map.get(&1, name))
	end

	def create_room(hub, name) do
		room = Agent.get(hub, &Map.get(&1, name))
		if room != nil do
			{:exists, room}
		else
			{:ok, room} = ElixirChat.Room.start_link
			Agent.update(hub, &Map.put(&1, name, room))
			{:created, room}
		end
	end
end