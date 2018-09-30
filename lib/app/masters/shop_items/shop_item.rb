module Twfarm
  module Master
    class ShopItem
      @@shop_items = []
      def self.all
        YAML.load_file("#{__dir__}/data.yml")
      end
    end
  end
end
