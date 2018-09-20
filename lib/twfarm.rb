require "thor"
require "sqlite3"

require "constants/version"
require "constants/directories"
require "constants/files"
require "app/initializer"
require "app/db"

require "commands/test"

module Twfarm
  def self.start
    Initializer.new
    Twfarm::CLI.start
  end
  class CLI < Thor
    register Test, "test", "test", "Puts test"
  end
end
