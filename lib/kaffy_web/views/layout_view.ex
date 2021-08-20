defmodule KaffyWeb2.LayoutView do
  @moduledoc false

  use Phoenix.View,
    root: "lib/kaffy_web/templates",
    namespace: KaffyWeb2

  import Phoenix.Controller, only: [get_flash: 2]
  use Phoenix.HTML
end
