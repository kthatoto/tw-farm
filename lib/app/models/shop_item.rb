module Twfarm
  class ShopItem

    def self.exists?
      $db.execute("SELECT COUNT(*) FROM shop_items").first.first > 0
    end
  end
end
