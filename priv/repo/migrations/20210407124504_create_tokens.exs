defmodule GeoTaskTracker.Repo.Migrations.CreateTokens do
  use Ecto.Migration

  def change do
    create table(:tokens) do
      add :token, :string
      add :role, :string

      timestamps()
    end
  end
end
