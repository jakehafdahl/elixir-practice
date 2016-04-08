defmodule ElixirChat.HubTests do
	use ExUnit.Case, async: true

	test "stores a chatroom by name" do
		{:ok, hub} = ElixirChat.Hub.start_link
		assert ElixirChat.Hub.get_room(hub, "testroom") == nil

		ElixirChat.Hub.create_room(hub, "testroom")
		assert ElixirChat.Hub.get_room(hub, "testroom") != nil
	end
	
end