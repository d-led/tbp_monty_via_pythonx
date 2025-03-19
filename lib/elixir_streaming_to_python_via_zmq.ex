defmodule ElixirStreamingToPythonViaZmq do
  use GenServer

  def start(_type, _args) do
    ElixirStreamingToPythonViaZmq.start_link([])
  end

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(state) do
    schedule_stop()
    {:ok, state}
  end

  def handle_info(:stop, state) do
    IO.puts("Stopping after a timeout")
    System.halt(0)
    {:stop, :normal, state}
  end

  defp schedule_stop do
    Process.send_after(self(), :stop, 10_000)
  end
end
