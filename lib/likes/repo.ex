defmodule Likes.Repo do
  use Ecto.Repo,
    otp_app: :likes,
    adapter: Ecto.Adapters.Postgres
end
