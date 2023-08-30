defmodule PhoenixApiWeb.BenchmarksController do
  use PhoenixApiWeb, :controller

  def index(conn, _params) do
    1..1000000 |> Enum.each( fn(a) ->  end)
    :timer.sleep(20)
    conn
    |> put_status(200)
    |> json(%{message: "it works!"})
  end
end
