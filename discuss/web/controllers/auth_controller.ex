defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug Ueberauth

  def callback(conn, params) do
    IO.inspect "0000000000000"
    IO.inspect conn.assigns
    IO.inspect "1111111111111"
    IO.inspect params
    IO.inspect "2222222222222"
  end
end
