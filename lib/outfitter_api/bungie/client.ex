defmodule OutfitterApi.Bungie.Client do
  @moduledoc """
  An HTTP client that talks to the Bungie API
  """

  use Tesla

  @base_url "https://www.bungie.net/Platform"
  @api_key "totally-an-api-key"

  plug Tesla.Middleware.BaseUrl, @base_url
  plug Tesla.Middleware.Headers, %{"X-API-Key" => @api_key}
  plug Tesla.Middleware.JSON

  def base_url do
    @base_url
  end
end
