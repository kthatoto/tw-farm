module Twfarm
  class Seed

    def self.create(**values)
      raise unless $user
      get_values
      $db.execute(
        "INSERT INTO seeds (
          user_id, plant_id, level,
          size_potential, growth_potential,
          max_seeds_number, min_seeds_number
        ) values (?, ?, ?, ?, ?, ?, ?)",
        $user[:id], @plant_id, @level,
        @size_potential, @growth_potential,
        @max_seeds_number, @min_seeds_number
      )
    end

    private
    def get_values
      @plant_id = values[:plant_id]
      @level = values[:level] || 1
      @size_potential = values[:size_potential]
      @growth_potential = values[:growth_potential]
      @max_seeds_number = values[:max_seeds_number]
      @min_seeds_number = values[:min_seeds_number]
    end
  end
end
