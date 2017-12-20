defmodule OutfitterApi.BungieTest do
  use OutfitterApi.DataCase

  alias OutfitterApi.Bungie

  describe "accounts" do
    alias OutfitterApi.Bungie.Account

    @valid_attrs %{}

    def account_fixture(attrs \\ %{}) do
      account_data = Enum.into(attrs, @valid_attrs)
      struct(Account, account_data)
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Bungie.get_account!(account.id) == account
    end
  end
end
