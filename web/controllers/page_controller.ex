defmodule HellowPhoenix.PageController do
  use HellowPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
