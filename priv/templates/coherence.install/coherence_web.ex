defmodule <%= base %>.Coherence.Web do
  @template_path "web/templates/coherence"

  def view(template_path \\ @template_path) do
    quote do
      use Phoenix.View, root: unquote(template_path)
      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import <%= base %>.Router.Helpers
      import <%= base %>.ErrorHelpers
      import <%= base %>.Gettext
      import <%= base %>.Coherence.ViewHelpers
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
  defmacro __using__([which | args]) do
    apply(__MODULE__, which, args)
  end
end
