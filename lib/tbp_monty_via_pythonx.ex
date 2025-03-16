defmodule TbpMontyViaPythonx do
  @moduledoc """
  Documentation for `TbpMontyViaPythonx`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TbpMontyViaPythonx.hello()
      %{"num_nodes" => 3}

  """
  def hello do
    {model, _globals} = Pythonx.eval(
      """
      import numpy as np
      from scipy.spatial.transform import Rotation
      from tbp.monty.frameworks.utils.spatial_arithmetics import check_orthonormal

      from tbp.monty.frameworks.models.object_model import (
          GraphObjectModel,
          GridObjectModel,
          GridTooSmallError,
      )

      model = GridObjectModel(
            "test_model", max_nodes=3, max_size=10, num_voxels_per_dim=10
      )

      dummy_locs = np.array([[0, 0, 0], [0, 1, 0], [1, 0, 0], [1, 1, 0]])
      dummy_pv = np.eye(3)
      pv = dummy_pv.flatten()
      dummy_features = {
          "pose_vectors": np.vstack([pv, pv, pv, pv]),
          "pose_fully_defined": np.array([True, True, True, True]),
          "hsv": np.array(
              [
                  [0.1, 1, 1],
                  [0.0, 1, 1],
                  [0.9, 1, 1],
                  [0.8, 1, 1],
              ]
          ),
          "curvature": np.array([0, 1, 2, 1]),
      }
      model.build_model(
          dummy_locs,
          dummy_features,
      )

      # return
      {"num_nodes": model.num_nodes}
      """,
      %{}
    )
    Pythonx.decode(model)
  end
end
