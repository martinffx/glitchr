defmodule Release.Tasks do
  def migrate do
    {:ok, _} = Application.ensure_all_started(:glitchr)

    path = Application.app_dir(:glitchr, "priv/repo/migrations")

    Ecto.Migrator.run(Glitchr.Repo, path, :up, all: true)

    :init.stop()
  end
end
