require "envoker/rack"

Envoker::Rack.load

module Settings
  def self.fetch(key)
    return ENV.fetch(key) do
      raise(sprintf("ENV[%p] not found", key))
    end
  end

  RACK_ENV       = fetch("RACK_ENV")
  SESSION_KEY    = fetch("SESSION_KEY")
  SESSION_SECRET = fetch("SESSION_SECRET")
end