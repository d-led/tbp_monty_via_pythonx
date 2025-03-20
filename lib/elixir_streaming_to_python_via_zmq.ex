defmodule ElixirStreamingToPythonViaZmq do
  use GenServer

  def start(_type, _args) do
    ElixirStreamingToPythonViaZmq.start_link([])
  end

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(state) do
    start_linked_processes()
    schedule_stop()
    {:ok, state}
  end

  def handle_info(:stop, state) do
    IO.puts("#{__MODULE__} stopping after a timeout")
    System.halt(0)
    {:stop, :normal, state}
  end

  defp schedule_stop do
    Process.send_after(self(), :stop, 5_000)
  end

  defp start_linked_processes do
    {:ok, _producer} = ElixirStreamingProducer.start_link([])
    {:ok, _receiver} = PythonPollingReceiver.start_link([])
  end
end
