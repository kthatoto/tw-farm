module Twfarm
  class Seed

    def self.create(plant_id)
      $db.execute(
        "INSERT INTO seeds (user_id, plant_id, level) values(?, ?, ?)",
        $user[:id], plant_id, 1
      )
    end
  end
end
