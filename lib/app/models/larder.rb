module Twfarm
  class Larder

    def self.create(**values)
      raise unless $user
      get_values(values)
      $db.execute(
        "INSERT INTO larders (user_id, level, capacity) values (?, ?, ?)",
        $user[:id], @level, @capacity
      )
    end

    private
    def self.get_values(values)
      @level = values[:level]
      @capacity = values[:capacity]
    end
  end
end
