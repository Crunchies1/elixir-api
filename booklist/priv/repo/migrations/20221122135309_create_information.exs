defmodule Booklist.Repo.Migrations.CreateInformation do
  use Ecto.Migration

  def change do
    create table(:information) do
      add :name, :string
      add :author, :string

      timestamps()
    end
  end
end
