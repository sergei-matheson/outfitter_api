@moduledoc """
A schema is a keyword list which represents how to map, transform, and validate
configuration values parsed from the .conf file. The following is an explanation of
each key in the schema definition in order of appearance, and how to use them.

## Import

A list of application names (as atoms), which represent apps to load modules from
which you can then reference in your schema definition. This is how you import your
own custom Validator/Transform modules, or general utility modules for use in
validator/transform functions in the schema. For example, if you have an application
`:foo` which contains a custom Transform module, you would add it to your schema like so:

`[ import: [:foo], ..., transforms: ["myapp.some.setting": MyApp.SomeTransform]]`

## Extends

A list of application names (as atoms), which contain schemas that you want to extend
with this schema. By extending a schema, you effectively re-use definitions in the
extended schema. You may also override definitions from the extended schema by redefining them
in the extending schema. You use `:extends` like so:

`[ extends: [:foo], ... ]`

## Mappings

Mappings define how to interpret settings in the .conf when they are translated to
runtime configuration. They also define how the .conf will be generated, things like
documention, @see references, example values, etc.

See the moduledoc for `Conform.Schema.Mapping` for more details.

## Transforms

Transforms are custom functions which are executed to build the value which will be
stored at the path defined by the key. Transforms have access to the current config
state via the `Conform.Conf` module, and can use that to build complex configuration
from a combination of other config values.

See the moduledoc for `Conform.Schema.Transform` for more details and examples.

## Validators

Validators are simple functions which take two arguments, the value to be validated,
and arguments provided to the validator (used only by custom validators). A validator
checks the value, and returns `:ok` if it is valid, `{:warn, message}` if it is valid,
but should be brought to the users attention, or `{:error, message}` if it is invalid.

See the moduledoc for `Conform.Schema.Validator` for more details and examples.
"""
[
  extends: [],
  import: [],
  mappings: [
    "logger.console.format": [
      commented: false,
      datatype: :binary,
      default: """
      $time $metadata[$level] $message
      """,
      doc: "Provide documentation for logger.console.format here.",
      hidden: false,
      to: "logger.console.format"
    ],
    "logger.console.metadata": [
      commented: false,
      datatype: [
        list: :atom
      ],
      default: [
        :request_id
      ],
      doc: "Provide documentation for logger.console.metadata here.",
      hidden: false,
      to: "logger.console.metadata"
    ],
    "logger.level": [
      commented: false,
      datatype: :atom,
      default: :info,
      doc: "Provide documentation for logger.level here.",
      hidden: false,
      to: "logger.level"
    ],
    "outfitter_api.ecto_repos": [
      commented: false,
      datatype: [
        list: :atom
      ],
      default: [
        OutfitterApi.Repo
      ],
      doc: "Provide documentation for outfitter_api.ecto_repos here.",
      hidden: true,
      to: "outfitter_api.ecto_repos"
    ],
    "outfitter_api.generators.binary_id": [
      commented: false,
      datatype: :atom,
      default: true,
      doc: "Provide documentation for outfitter_api.generators.binary_id here.",
      hidden: true,
      to: "outfitter_api.generators.binary_id"
    ],
    "outfitter_api.bungie.api_key": [
      commented: false,
      datatype: :binary,
      default: "totally-a-real-api-key",
      doc: "Provide documentation for outfitter_api.bungie.api_key here.",
      hidden: false,
      to: "outfitter_api.bungie.api_key"
    ],
    "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.render_errors.view": [
      commented: false,
      datatype: :atom,
      default: OutfitterApiWeb.ErrorView,
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApiWeb.Endpoint.render_errors.view here.",
      hidden: true,
      to: "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.render_errors.view"
    ],
    "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.render_errors.accepts": [
      commented: false,
      datatype: [
        list: :binary
      ],
      default: [
        "json"
      ],
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApiWeb.Endpoint.render_errors.accepts here.",
      hidden: true,
      to: "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.render_errors.accepts"
    ],
    "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.pubsub.name": [
      commented: false,
      datatype: :atom,
      default: OutfitterApi.PubSub,
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApiWeb.Endpoint.pubsub.name here.",
      hidden: true,
      to: "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.pubsub.name"
    ],
    "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.pubsub.adapter": [
      commented: false,
      datatype: :atom,
      default: Phoenix.PubSub.PG2,
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApiWeb.Endpoint.pubsub.adapter here.",
      hidden: true,
      to: "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.pubsub.adapter"
    ],
    "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.load_from_system_env": [
      commented: false,
      datatype: :atom,
      default: true,
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApiWeb.Endpoint.load_from_system_env here.",
      hidden: true,
      to: "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.load_from_system_env"
    ],
    "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.url.host": [
      commented: false,
      datatype: :binary,
      default: "example.com",
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApiWeb.Endpoint.url.host here.",
      hidden: false,
      env_var: "OUTFITTER_API_URL_HOST",
      to: "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.url.host"
    ],
    "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.url.port": [
      commented: false,
      datatype: :integer,
      default: 80,
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApiWeb.Endpoint.url.port here.",
      hidden: false,
      env_var: "OUTFITTER_API_URL_PORT",
      to: "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.url.port"
    ],
    "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.cache_static_manifest": [
      commented: false,
      datatype: :binary,
      default: "priv/static/cache_manifest.json",
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApiWeb.Endpoint.cache_static_manifest here.",
      hidden: true,
      to: "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.cache_static_manifest"
    ],
    "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.secret_key_base": [
      commented: false,
      datatype: :binary,
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApiWeb.Endpoint.secret_key_base here.",
      env_var: "OUTFITTER_API_SECRET_KEY_BASE",
      hidden: false,
      to: "outfitter_api.Elixir.OutfitterApiWeb.Endpoint.secret_key_base"
    ],
    "outfitter_api.Elixir.OutfitterApi.Repo.adapter": [
      commented: false,
      datatype: :atom,
      default: Ecto.Adapters.Postgres,
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApi.Repo.adapter here.",
      hidden: false,
      to: "outfitter_api.Elixir.OutfitterApi.Repo.adapter"
    ],
    "outfitter_api.Elixir.OutfitterApi.Repo.username": [
      commented: false,
      datatype: :binary,
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApi.Repo.username here.",
      hidden: false,
      env_var: "OUTFITTER_API_DB_USERNAME",
      to: "outfitter_api.Elixir.OutfitterApi.Repo.username"
    ],
    "outfitter_api.Elixir.OutfitterApi.Repo.password": [
      commented: false,
      datatype: :binary,
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApi.Repo.password here.",
      hidden: false,
      env_var: "OUTFITTER_API_DB_PASSWORD",
      to: "outfitter_api.Elixir.OutfitterApi.Repo.password"
    ],
    "outfitter_api.Elixir.OutfitterApi.Repo.database": [
      commented: false,
      datatype: :binary,
      default: "outfitter_api_prod",
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApi.Repo.database here.",
      hidden: false,
      env_var: "OUTFITTER_API_DB_NAME",
      to: "outfitter_api.Elixir.OutfitterApi.Repo.database"
    ],
    "outfitter_api.Elixir.OutfitterApi.Repo.pool_size": [
      commented: false,
      datatype: :integer,
      default: 15,
      doc: "Provide documentation for outfitter_api.Elixir.OutfitterApi.Repo.pool_size here.",
      hidden: false,
      to: "outfitter_api.Elixir.OutfitterApi.Repo.pool_size"
    ]
  ],
  transforms: [],
  validators: []
]
