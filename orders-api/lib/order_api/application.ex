defmodule OrderApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: OrderApi.Worker.start_link(arg)
      # {OrderApi.Worker, arg}
      Plug.Cowboy.child_spec(scheme: :http, plug: OrderApi.Router, options: [port: 8085])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OrderApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
