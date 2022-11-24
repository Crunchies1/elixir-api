defmodule BooklistWeb.Schema do
  use Absinthe.Schema

  @desc "A Book"
    object :book do
      field :id, :integer
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
    field :get_book, :book do
      arg(:id, non_null(:id))
      resolve(fn args, _ ->
        {:ok, Booklist.Book.get_info!(args)}
      end)
    end
  end

  mutation do
    field :create_book, :book do
      arg(:name, non_null(:string))
      arg(:author, non_null(:string))
      resolve(fn args, _ ->
        {:ok, Booklist.Book.create_info(args)}
      end)
    end
  end
end
