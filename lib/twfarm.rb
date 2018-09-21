require "thor"
require "sqlite3"
require "yaml"

require "constants/version"
require "constants/directories"
require "constants/files"
require "constants/user_config"
require "utils/display"
require "app/initializer"
require "app/db"
require "app/models/plant"
require "app/models/user"
require "app/models/shop_item"
require "app/masters/plant/plant"
require "app/masters/shop_item/shop_item"

require "app/commands/check"
require "app/commands/shop"

module Twfarm
  def self.start
    Initializer.new
    Twfarm::CLI.start
  end
  class CLI < Thor
    register Check, "check", "check", "Check plants"
    register Shop, "shop", "shop", "Shop"
  end
end
