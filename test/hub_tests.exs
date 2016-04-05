defmodule ElixirChat.HubTests do
	use ExUnit.Case, async: true

	test "stores a chatroom by name" do
		{:ok, hub} ElixirChat.Hub.start_link
		assert ElixirChat.Hub.get(hub, "testroom") == nil

		ElixirChat.Hub.put(hub, "testroom", [])
		assert ElixirChat.Hub.get(hub, "testroom") == []
	end
	
end