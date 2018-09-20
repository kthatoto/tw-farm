module Twfarm
  class Shop < Thor::Group

    def shop
      pp Master::Plant.all_hash
    end
  end
end
