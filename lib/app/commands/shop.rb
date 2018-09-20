module Twfarm
  class Shop < Thor::Group

    def shop
      pp Master::ShopItem.all
      pp Master::Plant.all
    end
  end
end
