defmodule OrderApi.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  plug(:match)
  plug(:dispatch)

  get "/hello" do
    {:ok, response} = HTTPoison.get('http://www.mocky.io/v2/5817803a1000007d01cc7fc9')

    data = Poison.decode!(response.body)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(data))
  end

  post "/post" do
    { :ok, body, conn } = read_body(conn)
    { :ok, data } = Poison.decode(body)

    send_resp(conn, 201, Poison.encode!(%{
      message: data["message"]
    }))
  end

  match _ do
    send_resp(conn, 404, 'not found')
  end
end
