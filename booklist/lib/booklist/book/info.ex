defmodule Booklist.Book.Info do
  use Ecto.Schema
  import Ecto.Changeset

  schema "information" do
    field :author, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(info, attrs) do
    info
    |> cast(attrs, [:name, :author])
    |> validate_required([:name, :author])
  end
end
