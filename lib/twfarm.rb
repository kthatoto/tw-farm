require "thor"
require "sqlite3"

require "constants/version"
require "constants/directories"
require "constants/files"
require "constants/user_config"
require "app/initializer"
require "app/db"
require "app/data/plant"
require "app/data/user"

require "commands/check"

module Twfarm
  def self.start
    Initializer.new
    Twfarm::CLI.start
  end
  class CLI < Thor
    register Check, "check", "check", "Check plants"
  end
end
