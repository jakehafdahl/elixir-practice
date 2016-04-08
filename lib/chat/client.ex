defmodule ElixirChat.Client do
	
	def start_link do
		Agent.start_link(fn -> receive_message end)
	end

	def receive_message do
		receive do
			{:inbound_message, body} -> body
			_ -> receive_message
		end
	end
end