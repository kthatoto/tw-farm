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

    def self.all
      $db.execute(
        "SELECT
          id, display_id, space
        FROM fields WHERE user_id = ?", $user[:id]
      ).map do |row|
        { id: row[0], display_id: row[1], space: row[2] }
      end
    end

    def self.first
      $db.execute("SELECT id, display_id, space FROM fields LIMIT 1").map{|row|
        { id: row[0], display_id: row[1], space: row[2] }
      }.first
    end


    private
    def self.get_values(values)
      @space = values[:space]
    end
  end
end
