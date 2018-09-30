module Twfarm
  class Field

    def self.create(**values)
      raise unless $user
      get_values(values)
      display_id = "fld-" + SecureRandom.hex(6)
      $db.execute(
        "INSERT INTO fields (display_id, user_id, space) values (?, ?, ?)",
        display_id, $user[:id], @space
      )
    end

    private
    def self.get_values(values)
      @space = values[:space]
    end
  end
end
