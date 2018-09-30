module Twfarm
  class Shop < Thor

    default_command :shop

    desc "", "Show shop items"
    def shop
      get_shop_items
      show_items
    end

    desc "buy [id]", "Buy item"
    def buy(id = false)
      unless id
        Twfarm.twputs_error "Require [id]"
        return
      end
      id = id.to_i
      get_shop_items
      buying_shop_item = @shop_items.find{|item|
        item["shop_item_id"] == id.to_i
      }
      unless buying_shop_item
        Twfarm.twputs_error "ID:#{id} item not found in Shop"
      end
      pp buying_shop_item
    end

    private
    def get_shop_items
      master_shop_items = Master::ShopItem.all
      @shop_items = []
      master_shop_items.select{|row|
        row["shop_itemable_type"] == "plant"
      }.each{|row|
        @shop_items << Master::Plant.get_by_id(row["shop_itemable_id"]).merge(
          {
            "shopping_item_id" => row["master_id"],
            "type" => row["shop_itemable_type"],
          }
        )
      }
    end

    def show_items
      Twfarm.twputs Twfarm.greenen("[Shop]")
      Twfarm.twputs Twfarm.greenen("{Plant Seeds}"), 1
      @shop_items.select{|row|
        row["type"] == "plant"
      }.each{|item|
        line = "#{item["shopping_item_id"]} => name:#{item["name"]}, price:#{item["seed_price"]}"
        Twfarm.twputs line, 2
      }
    end
  end
end
