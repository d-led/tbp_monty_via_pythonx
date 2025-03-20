# TbpMontyViaPythonx

## Calling tbp.monty classes from Elixir

```shell
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export OMP_NUM_THREADS=1
mix deps.get
mix test
```

- source: [lib/tbp_monty_via_pythonx.ex](lib/tbp_monty_via_pythonx.ex)

## Pushing Data from Elixir to Python via ZeroMQ

```shell
mix run --no-halt
```

- producer: [lib/elixir_streaming_producer.ex](lib/elixir_streaming_producer.ex)
- consumer: [lib/python_polling_receiver.ex](lib/python_polling_receiver.ex)
  - the consumer is driven from Elixir but it is decoupled via ZeroMQ and could be in a separate codebase altogether