module Twfarm
  class Seeds < Thor::Group

    def seeds
      seeds = Seed.all
      plants_hash = Master::Plant.get_hash_by_ids(seeds.map{|seed| seed[:plant_id]}.uniq)
      Twfarm.twputs Twfarm.greenen("id,name,level")
      seeds.each do |seed|
        plant = plants_hash[seed[:plant_id]]
        o = ""
        o << seed[:id].to_s + ","
        o << Twfarm.rgb(plant["name"], plant["background_color"], plant["font_color"]) + ","
        o << seed[:level].to_s
        Twfarm.twputs o
      end
    end
  end
end
