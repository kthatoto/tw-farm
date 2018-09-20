module Twfarm
  class User

    def self.first
      $db.execute("SELECT id, money FROM users LIMIT 1").map{|row|
        {
          id: row[0],
          money: row[1],
        }
      }.first
    end

    def self.create
      $db.execute(
        "INSERT INTO users (money) values(?)",
        UserConfig::INITIAL_MONEY
      )
    end
  end
end
