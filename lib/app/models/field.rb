module Twfarm
  class Field

    def self.create(**values)
      raise unless $user
      get_values(values)
      $db.execute(
        "INSERT INTO fields (user_id, space) values (?, ?)",
        $user[:id], @space
      )
    end

    private
    def self.get_values(values)
      @space = values[:space]
    end
  end
end
