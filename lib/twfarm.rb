require "thor"
require "constants/version"

require "commands/test"

module Twfarm
  class CLI < Thor
    register Twfarm::Test, "test", "test", "Puts test"
  end
end
