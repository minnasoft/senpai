[
  import_deps: [:ecto, :ecto_sql],
  subdirectories: ["priv/*/migrations", "apps/*"],
  plugins: [Phoenix.LiveView.HTMLFormatter, Styler],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}", "priv/*/seeds.exs"]
]
