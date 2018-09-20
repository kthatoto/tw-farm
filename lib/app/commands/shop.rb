module Twfarm
  class Shop < Thor::Group

    def shop
      pp ShopItem.exists?
    end
  end
end
