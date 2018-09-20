module Twfarm
  class Plant

    def self.all
      $db.execute("SELECT id FROM plants").map do |row|
        {
          id: row[0],
        }
      end
    end
  end
end
