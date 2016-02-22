require "bundler/setup"
require "cuba"
require "cuba/safe"
require "cuba/render"
require "ment"

require_relative "config/encoding"
require_relative "config/settings"

Cuba.plugin(Cuba::Safe)
Cuba.plugin(Cuba::Render)
Cuba.plugin(Ment)

Cuba.use(
  Rack::Session::Cookie,
  key: Settings::SESSION_KEY,
  secret: Settings::SESSION_SECRET,
  http_only: Cuba.production?,
  secure: Cuba.production?
)

Cuba.use(
  Rack::Static,
  urls: %w(/js /css /img),
  root: "./public"
)

Dir["./models/**/*.rb"].each   { |f| require(f) }
Dir["./filters/**/*.rb"].each  { |f| require(f) }
Dir["./services/**/*.rb"].each { |f| require(f) }
Dir["./helpers/**/*.rb"].each  { |f| require(f) }
Dir["./routes/**/*.rb"].each   { |f| require(f) }

Cuba.plugin(ApplicationHelpers)

Cuba.define do
  on csrf.unsafe? do
    csrf.reset!

    res.status = 403
    res.write("Forbidden: Invalid CSRF token.")

    halt(res.finish)
  end

  on root do
    res.write partial("home.html")
  end
end