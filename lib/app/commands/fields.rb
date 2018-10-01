module Twfarm
  class Fields < Thor::Group

    def fields
      if option_index = ARGV.index("-d")
        return detail(ARGV[option_index + 1])
      end
      return index
    end

    private
    def index
      fields = Field.all
      Twfarm.twputs Twfarm.greenen("id,used/cap")
      fields.each do |field|
        seedlings = Seedling.get_by_field_id(field[:id])
        used_space = seedlings.map{|seedling|
          plant = Master::Plant.get_by_id(seedling[:plant_id])
          plant["required_spqce"]
        }.inject(:+)
        o = ""
        o += field[:display_id].to_s + ","
        o += "#{used_space}/#{field[:space]}"
        Twfarm.twputs o
      end
    end
    def detail(field_id)
      Twfarm.twputs field_id
    end
  end
end
