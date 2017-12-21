defmodule OutfitterApi.Bungie.Client do
  @moduledoc """
  An HTTP client that talks to the Bungie API
  """

  use Tesla

  @base_url "https://www.bungie.net/Platform/Destiny2"
  @api_key Application.get_env(:outfitter_api, :bungie)[:api_key]

  plug Tesla.Middleware.BaseUrl, @base_url
  plug Tesla.Middleware.Headers, %{"X-API-Key" => @api_key}
  plug Tesla.Middleware.JSON

  def base_url do
    @base_url
  end

  def api_key do
    @api_key
  end
end
