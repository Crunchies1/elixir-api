defmodule BooklistWeb.Schema do
  use Absinthe.Schema

  @desc "A Book"
    object :book do
      field :name, :string
      field :author, :string

    end

  # Example data
  @book_information %{
    "book1" => %{id: 1, name: "Harry Potter", author: "JK Rowling"},
    "book2" => %{id: 2, name: "Charlie Factory", author: "Bernard"},
    "book3" => %{id: 3, name: "Sherlock Holmes", author: "Sheikhu"}
  }

  query do
    field :book_info, :book do
      arg :id, non_null(:id)
      resolve fn %{id: book_id}, _ ->
        {:ok, @book_information[book_id]}
      end
    end
  end
 end
