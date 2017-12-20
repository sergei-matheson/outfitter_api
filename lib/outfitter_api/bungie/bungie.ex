defmodule OutfitterApi.Bungie do
  @moduledoc """
  The Bungie context.
  """

  alias OutfitterApi.Bungie.Account

  #alias OutfitterApi.Bungie.Client

  @doc """
  Gets a single account.

  Raises if the Account does not exist.

  ## Examples

      iex> get_account!(123)
      %Account{}

  """
  def get_account!(id) do
    %Account{id: id}
  end
end
