# Discuss

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


## Eric's Notes

* Create project: `mix phoenix.new discuss`
* Create Postgres DB: `mix ecto.create`
* Above failed, probably due to package mismatches. Added `, adapter: Ecto.Adapters.Postgres` to end of `lib/discuss/repo.ex`. Re-ran ecto.create command.
* Still failed because Ecto Adapter is no longer included by default. Added `{:ecto_sql, "~> 3.0"},` to dependencies in `mix.exs`. Re-ran acto.create command, with success. Check Postgres credendtials in `config/dev.exs`.
* Start Phoenix server: `mix phoenix.server`
* Pheonix uses Bootstrap by default. Go to `materializecss.com`, click `GET STARTED`, and copy `<link>` tag and add it to `templates/layout/app.html.eex`. Material Design is more modern looking.
* To experiment invoking methods directly, start the Phoenix server in the command shell: `iex -S mix phoenix.server`
