require "thor"
require "constants/version"
require "constants/directories"
require "app/init"

require "commands/test"

module Twfarm
  def self.start
    Twfarm.init
    Twfarm::CLI.start
  end
  class CLI < Thor
    register Twfarm::Test, "test", "test", "Puts test"
  end
end
