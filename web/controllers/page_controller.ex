defmodule Glitchr.PageController do
  use Glitchr.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
