module Twfarm
  class Larder

    def self.create(**values)
      raise unless $user
      get_values(values)
      display_id = "ld-" + SecureRandom.hex(6)
      $db.execute(
        "INSERT INTO larders (display_id, user_id, level, capacity) values (?, ?, ?, ?)",
        display_id, $user[:id], @level, @capacity
      )
    end

    private
    def self.get_values(values)
      @level = values[:level]
      @capacity = values[:capacity]
    end
  end
end
