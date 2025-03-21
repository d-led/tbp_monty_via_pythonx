defmodule ElixirStreamingProducer do
  use GenServer
  require Logger
  alias :chumak, as: Chumak

  @push_interval_ms 100

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{socket: nil, counter: 1}, name: __MODULE__)
  end

  def init(state) do
    Logger.info(
      "#{__MODULE__} started, pushing every #{@push_interval_ms}ms, incrementing the counter by 1"
    )

    {:ok, socket} = Chumak.socket(:pub)
    {:ok, _peer_pid} = Chumak.bind(socket, :tcp, ~c"*", 5555)
    schedule_push()
    {:ok, %{state | socket: socket}}
  end

  def handle_info(:push_message, %{socket: socket, counter: counter} = state) do
    push_message(socket, counter)
    schedule_push()
    {:noreply, %{state | counter: counter + 1}}
  end

  defp schedule_push do
    Process.send_after(self(), :push_message, @push_interval_ms)
  end

  defp push_message(socket, counter) do
    message = %{counter: counter, random_number: :rand.uniform(100)} |> Jason.encode!()
    :ok = Chumak.send(socket, message)
  end
end
