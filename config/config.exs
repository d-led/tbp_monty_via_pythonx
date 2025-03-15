import Config

config :pythonx, :uv_init,
  pyproject_toml: """
  [project]
  name = "tbp_monty_via_pythonx"
  version = "0.0.0"
  requires-python = "==3.10.*"
  dependencies = [
    "tbp.monty @ git+https://github.com/thousandbrainsproject/tbp.monty.git"
  ]
  """
