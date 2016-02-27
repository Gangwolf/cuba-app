$VERBOSE = !!ENV["VERBOSE"]

ENV["RACK_ENV"] = "test"

require_relative "../app"
require "cuba/test"
require "posten/test"

prepare do
end
