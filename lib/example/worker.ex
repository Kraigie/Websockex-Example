defmodule Example.Worker do

  require Logger

	def start_link do
    WebSockex.start_link("wss://gateway.discord.gg/?encoding=etf&v=6", __MODULE__, %{})
	end

  def handle_connect(_conn, state) do
    IO.inspect "Inside connect handler"
    {:ok, state}
  end

  def handle_disconnect(%{reason: reason}, state) do
    Logger.warn "websocket closing: #{inspect reason}"
    {:ok, state}
  end

  def handle_frame({:binary, frame}, state) do
    IO.inspect "Received frame"
    {:ok, state}
  end
end