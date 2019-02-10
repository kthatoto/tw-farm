module Twfarm
  class Fields < Thor::Group

    def fields
      if detail_option_index = ARGV.index("-d") || ARGV.index("--detail")
        return detail(ARGV[detail_option_index + 1])
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
    def detail(field_display_id)
      return Twfarm.twputs_error "field_id is required" unless field_display_id
      field = Field.find_by_display_id(field_display_id)
      #### start tmp
      unless field
        field = Field.find_by_display_id(field_display_id.slice(4, 20))
      end
      #### end tmp
      return Twfarm.twputs_error "field:#{field_display_id} is not found" unless field

      seedlings = Seedling.get_by_field_id(field[:id])
      plants_hash = Master::Plant.get_hash_by_ids(
        seedlings.map{|seedling| seedling[:plant_id]}.uniq
      )

      Twfarm.twputs Twfarm.greenen("id,name,level,growth")
      seedlings.each do |seedling|
        plant = plants_hash[seedling[:plant_id]]
        o = ""
        o += seedling[:display_id] + ","
        o += Twfarm.rgb(plant["name"], plant["background_color"], plant["font_color"]) + ","
        o += seedling[:level].to_s + ","
        o += seedling[:current_growth].floor.to_s + "/" + seedling[:maturity_growth].floor.to_s
        Twfarm.twputs o
      end
    end
  end
end
