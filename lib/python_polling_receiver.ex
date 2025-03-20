defmodule PythonPollingReceiver do
  use GenServer
  require Logger

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_state) do
    Logger.info("#{__MODULE__} started")

    {_, globals} =
      Pythonx.eval("""
      import zmq
      import time
      import logging
      logging.basicConfig(level=logging.DEBUG, format="{asctime} [{levelname}] {message}", style="{")
      context = zmq.Context()

      logging.info('python: connecting to elixir')
      socket = context.socket(zmq.PULL)
      socket.connect("tcp://localhost:5555")
      """,%{})

    {:ok, %{globals: globals}}
  end
end
