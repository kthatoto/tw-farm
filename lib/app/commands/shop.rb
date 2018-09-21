module Twfarm
  class Shop < Thor

    default_command :shop

    desc "", "Show shop items"
    def shop
      get_shop_items
      show_items
    end

    desc "buy [id]", "Buy items"
    def buy(id = false)
      get_shop_items
      Twfarm.twputs "You have bought id:#{id} item!"
    end

    private
    def get_shop_items
      master_shop_items = Master::ShopItem.all
      @shop_items = {
        plants: [],
        fertilizer: [],
      }
      @shop_items[:plants] = master_shop_items.select{|row|
        row["shop_itemable_type"] == "plant"
      }.map{|row|
        Master::Plant.get_by_id(row["shop_itemable_id"]).merge(
          {"shop_item_id" => row["master_id"]}
        )
      }
    end

    def show_items
      Twfarm.twputs Twfarm.greenen("[Shop]")
      Twfarm.twputs Twfarm.greenen("{Plant Seeds}"), 1
      @shop_items[:plants].each do |item|
        line = "#{item["shop_item_id"]} => name:#{item["name"]}, price:#{item["seed_price"]}"
        Twfarm.twputs line, 2
      end
    end
  end
end
