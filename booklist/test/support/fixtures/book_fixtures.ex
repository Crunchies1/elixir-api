defmodule Booklist.BookFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Booklist.Book` context.
  """

  @doc """
  Generate a info.
  """
  def info_fixture(attrs \\ %{}) do
    {:ok, info} =
      attrs
      |> Enum.into(%{
        author: "some author",
        name: "some name"
      })
      |> Booklist.Book.create_info()

    info
  end
end
