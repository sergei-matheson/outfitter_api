defmodule OutfitterApi.BungieTest do
  use ExUnit.Case

  alias OutfitterApi.Bungie

  describe "accounts" do
    alias OutfitterApi.Bungie.Account
    alias OutfitterApi.Bungie.Client

    @valid_attrs %{}

    setup do
      valid_url = "#{Client.base_url}/User/GetBungieNetUserById/1/"
      Tesla.Mock.mock fn
        %{method: :get, url: ^valid_url} -> %Tesla.Env{status: 200, body: %{id: 1}}
        _ ->  %Tesla.Env{status: 404, body: "NotFound"}
      end
      :ok
    end

    def account_fixture(attrs \\ %{}) do
      account_data = Enum.into(attrs, @valid_attrs)
      struct(Account, account_data)
    end

    test "get_account!/1 uses the client to find the account with given id" do
      account = account_fixture(id: 1)
      assert Bungie.get_account!(account.id) == account
    end

    test "get_account!/1 raises an error if the account does not exist" do
      assert_raise(
        RuntimeError, "Unknown account id 2",
        fn ->
          Bungie.get_account!(2)
        end
      )
    end
  end
end
