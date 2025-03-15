import Config

config :pythonx, :uv_init,
  pyproject_toml: """
  [project]
  name = "tbp_monty_via_pythonx"
  version = "0.0.0"
  requires-python = "==3.8.*"
  dependencies = [
    "tbp.monty @ git+https://github.com/thousandbrainsproject/tbp.monty.git"
  ]
  """

  &darr;

  ```elixir
  ==> pythonx
Compiling 10 files (.ex)
Using CPython 3.8.20
Creating virtual environment at: .venv
  × No solution found when resolving dependencies:
  ╰─▶ Because habitat-sim==0.2.4.dev20230403 has no wheels with
      a matching Python version tag (e.g., `cp38`) and only
      habitat-sim==0.2.4.dev20230403 is available, we can conclude that all
      versions of habitat-sim cannot be used.
      And because tbp-monty==0.0.3 depends on habitat-sim, we can conclude
      that tbp-monty==0.0.3 cannot be used.
      And because only tbp-monty==0.0.3 is available and your project depends
      on tbp-monty, we can conclude that your project's requirements are
      unsatisfiable.

      hint: `habitat-sim` was requested with a pre-release marker (e.g.,
      habitat-sim==0.2.4.dev20230403), but pre-releases weren't enabled (try:
      `--prerelease=allow`)

      hint: Wheels are available for `habitat-sim` (v0.2.4.dev20230403) with
      the following Python ABI tag: `cp310`
```
