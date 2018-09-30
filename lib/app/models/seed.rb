module Twfarm
  class Seed

    def self.create(**values)
      raise unless $user
      get_values(values)
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

    def self.all
      $db.execute(
        "SELECT
          id, plant_id, level,
          size_potential, growth_potential,
          max_seeds_number, min_seeds_number
        FROM seeds WHERE user_id = ?", $user[:id]
      ).map do |row|
        {
          id: row[0], plant_id: row[1], level: row[2],
          size_potential: row[3], growth_potential: row[4],
          max_seeds_number: row[5], min_seeds_number: row[6]
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
