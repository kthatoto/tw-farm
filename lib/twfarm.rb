require "thor"
require "sqlite3"
require "yaml"
require "securerandom"

require "constants/version"
require "constants/directories"
require "constants/files"
require "constants/user_config"
require "utils/display"
require "app/initializer"
require "app/db"

require "app/models/user"
require "app/models/seed"
require "app/models/seedling"
require "app/models/shop_item"
require "app/models/field"
require "app/models/larder"

require "app/masters/plants/plant"
require "app/masters/shop_items/shop_item"

require "app/commands/check"
require "app/commands/seeds"
require "app/commands/fields"

module Twfarm
  def self.start
    Initializer.new
    Twfarm::CLI.start
  end
  class CLI < Thor
    register Check, "check", "check", "Check plants"
    register Seeds, "seeds", "seeds", "See Seeds"
    register Fields, "fields", "fields <options>", "See Fields"
  end
end
