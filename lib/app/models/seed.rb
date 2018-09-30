module Twfarm
  class Seed

    def self.create(**values)
      raise unless $user
      get_values(values)
      display_id = "sd-" + SecureRandom.hex(6)
      $db.execute(
        "INSERT INTO seeds (
          display_id, user_id, plant_id, level,
          size_potential, growth_potential,
          max_seeds_number, min_seeds_number
        ) values (?, ?, ?, ?, ?, ?, ?, ?)",
        display_id, $user[:id], @plant_id, @level,
        @size_potential, @growth_potential,
        @max_seeds_number, @min_seeds_number
      )
    end

    def self.all
      $db.execute(
        "SELECT
          id, display_id, plant_id, level,
          size_potential, growth_potential,
          max_seeds_number, min_seeds_number
        FROM seeds WHERE user_id = ?", $user[:id]
      ).map do |row|
        {
          id: row[0], display_id: row[1], plant_id: row[2], level: row[3],
          size_potential: row[4], growth_potential: row[5],
          max_seeds_number: row[6], min_seeds_number: row[7]
        }
      end
    end

    private
    def self.get_values(values)
      @plant_id = values[:plant_id]
      @level = values[:level] || 1
      @size_potential = values[:size_potential]
      @growth_potential = values[:growth_potential]
      @max_seeds_number = values[:max_seeds_number]
      @min_seeds_number = values[:min_seeds_number]
    end
  end
end
