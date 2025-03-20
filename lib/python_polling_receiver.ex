defmodule PythonPollingReceiver do
  use GenServer
  require Logger

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(state) do
    Logger.info("#{__MODULE__} started")
    {:ok, state}
  end
end
