require "thor"
require "constants/version"
require "app/init"

require "commands/test"

module Twfarm
  def self.start
    Twfarm::CLI.start
  end
  class CLI < Thor
    register Twfarm::Test, "test", "test", "Puts test"
  end
end
