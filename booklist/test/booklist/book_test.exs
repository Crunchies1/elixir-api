defmodule Booklist.BookTest do
  use Booklist.DataCase

  alias Booklist.Book

  describe "information" do
    alias Booklist.Book.Info

    import Booklist.BookFixtures

    @invalid_attrs %{author: nil, name: nil}

    test "list_information/0 returns all information" do
      info = info_fixture()
      assert Book.list_information() == [info]
    end

    test "get_info!/1 returns the info with given id" do
      info = info_fixture()
      assert Book.get_info!(info.id) == info
    end

    test "create_info/1 with valid data creates a info" do
      valid_attrs = %{author: "some author", name: "some name"}

      assert {:ok, %Info{} = info} = Book.create_info(valid_attrs)
      assert info.author == "some author"
      assert info.name == "some name"
    end

    test "create_info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Book.create_info(@invalid_attrs)
    end

    test "update_info/2 with valid data updates the info" do
      info = info_fixture()
      update_attrs = %{author: "some updated author", name: "some updated name"}

      assert {:ok, %Info{} = info} = Book.update_info(info, update_attrs)
      assert info.author == "some updated author"
      assert info.name == "some updated name"
    end

    test "update_info/2 with invalid data returns error changeset" do
      info = info_fixture()
      assert {:error, %Ecto.Changeset{}} = Book.update_info(info, @invalid_attrs)
      assert info == Book.get_info!(info.id)
    end

    test "delete_info/1 deletes the info" do
      info = info_fixture()
      assert {:ok, %Info{}} = Book.delete_info(info)
      assert_raise Ecto.NoResultsError, fn -> Book.get_info!(info.id) end
    end

    test "change_info/1 returns a info changeset" do
      info = info_fixture()
      assert %Ecto.Changeset{} = Book.change_info(info)
    end
  end
end
