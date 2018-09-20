module Twfarm
  class User

    def self.first
      $db.execute("SELECT id, tweny FROM users LIMIT 1").map{|row|
        {
          id: row[0],
          tweny: row[1],
        }
      }.first
    end

    def self.create
      $db.execute(
        "INSERT INTO users (tweny) values(?)",
        UserConfig::INITIAL_TWENY
      )
    end
  end
end
