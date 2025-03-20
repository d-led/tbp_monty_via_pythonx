defmodule ElixirStreamingProducer do
  use GenServer
  require Logger
  alias :chumak, as: Chumak

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{socket: nil}, name: __MODULE__)
  end

  def init(state) do
    Logger.info("#{__MODULE__} started")
    {:ok, socket} = Chumak.socket(:pub)
    {:ok, _peer_pid} = Chumak.bind(socket, :tcp, ~c"localhost", 5555)
    schedule_push()
    {:ok, %{state | socket: socket}}
  end

  def handle_info(:push_message, %{socket: socket} = state) do
    push_message(socket)
    schedule_push()
    {:noreply, state}
  end

  defp schedule_push do
    Process.send_after(self(), :push_message, 100)
  end

  defp push_message(socket) do
    message = %{data: "example"} |> Jason.encode!()
    :ok = Chumak.send(socket, message)
  end
end
