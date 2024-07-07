# Discuss

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Notes

* To render HTML:
```
DiscussWeb.PageHTML.home(%{})
Phoenix.Template.render(DiscussWeb.PageHTML, "test", "html", message: "Hello from IEx!")
Phoenix.Template.render_to_string(DiscussWeb.PageHTML, "test", "html", message: "Hello from IEx!")
```

* To create a migration:
```
mix ecto.gen.migration add_topics
mix ecto.migrate
```

* To test creating a record:
```
struct = %Discuss.Topics.Topic{}
params = %{title: "Title A"}
Discuss.Topics.Topic.changeset(struct, params)
```
