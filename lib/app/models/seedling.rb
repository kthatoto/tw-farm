module Twfarm
  class Seedling

    def self.create(**values)
      raise unless $user
      get_values(values)
      display_id = "sdl-" + SecureRandom.hex(6)
      $db.execute(
        "INSERT INTO seedlings (
          display_id, user_id, plant_id, field_id, level,
          size_potential, growth_potential,
          levelup_probability,
          growth_per_tick, current_growth, maturity_growth,
          max_seeds_number, min_seeds_number
        ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        display_id, $user[:id], @plant_id, @field_id, @level,
        @size_potential, @growth_potential,
        @levelup_probability,
        @growth_per_tick, 0, @maturity_growth,
        @max_seeds_number, @min_seeds_number
      )
    end

    def self.get_by_field_id(field_id)
      raise unless $user
      $db.execute(
        "SELECT
          id, display_id, plant_id, field_id, level,
          size_potential, growth_potential,
          levelup_probability,
          growth_per_tick, current_growth, maturity_growth,
          max_seeds_number, min_seeds_number
        FROM seedlings WHERE user_id = ? and field_id = ?", $user[:id], field_id
      ).map do |row|
        {
          id: row[0], display_id: row[1], plant_id: row[2], field_id: row[3], level: row[4],
          size_potential: row[5], growth_potential: row[6],
          levelup_probability: row[7],
          growth_per_tick: row[8], current_growth: row[9], maturity_growth: row[10],
          max_seeds_number: row[11], min_seeds_number: row[12]
        }
      end
    end

    private
    def self.get_values(values)
      @plant_id = values[:plant_id]
      plant = Master::Plant.get_by_id(@plant_id)
      @field_id = values[:field_id]
      @level = values[:level] || 1
      @size_potential = values[:size_potential]
      @growth_potential = values[:growth_potential]
      @levelup_probability = values[:levelup_probability] || 0
      @growth_per_tick = values[:growth_per_tick]
      @current_growth = 0
      @maturity_growth = plant["maturity_growth"]
      @max_seeds_number = values[:max_seeds_number]
      @min_seeds_number = values[:min_seeds_number]
    end
  end
end
