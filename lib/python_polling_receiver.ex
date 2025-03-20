defmodule PythonPollingReceiver do
  use GenServer
  require Logger

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_state) do
    Logger.info("#{__MODULE__} started, connecting...")

    {_, globals} =
      Pythonx.eval(
        """
        import zmq
        import time
        context = zmq.Context()

        socket = context.socket(zmq.SUB)
        socket.setsockopt_string(zmq.SUBSCRIBE, '')
        # receive last message only
        socket.setsockopt(zmq.CONFLATE, 1)
        socket.connect("tcp://localhost:5555")
        """,
        %{}
      )

    Logger.info("#{__MODULE__} connected")

    schedule_poll()

    {:ok, %{globals: globals}}
  end

  def handle_info(:recv, %{globals: globals} = state) do
    recv(globals)
    schedule_poll()
    {:noreply, state}
  end

  defp schedule_poll do
    Process.send_after(self(), :recv, 1000)
  end

  defp recv(globals) do
    {message, _} =
      Pythonx.eval(
        """
        socket.recv_string()
        """,
        globals
      )

    Logger.info("python: received message: #{Pythonx.decode(message)}")
  end
end
