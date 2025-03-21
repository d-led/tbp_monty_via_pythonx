import Config

config :pythonx, :uv_init,
  pyproject_toml: """
  [project]
  name = "tbp_monty_via_pythonx"
  version = "0.0.0"
  requires-python = "==3.11.*"
  dependencies = [
    # "tbp.monty @ git+https://github.com/thousandbrainsproject/tbp.monty.git",
    "tbp.monty @ git+https://github.com/d-led/tbp.monty.git@habitat-sim-optional",
    "pyzmq"
  ]
  """

config :tbp_monty_via_pythonx, :env, config_env()
