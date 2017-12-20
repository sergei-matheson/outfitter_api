defmodule OutfitterApi.BungieTest do
  use ExUnit.Case

  alias OutfitterApi.Bungie

  describe "accounts" do
    alias OutfitterApi.Bungie.Account
    alias OutfitterApi.Bungie.Client

    @valid_attrs %{}

    def mock_response(path, body) do
      url = "#{Client.base_url}#{path}"
      Tesla.Mock.mock fn
        %{method: :get, url: ^url} -> %Tesla.Env{status: 200, body: body}
      end
    end

    setup do
      mock_response("/User/GetBungieNetUserById/1/", %{id: 1})
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
  end
end
