module Twfarm
  class DB

    def initialize
      $db ||= SQLite3::Database.new(Files::DATABASE)
      Dir.glob("#{__dir__}/../tables/*").each do |file|
        File.open(file, "r") do |f|
          table = f.read
          table_name = table.split(" ")[2]
          current_schema = `sqlite3 #{Files::DATABASE} '.schema #{table_name}'`
          $db.execute(table) if current_schema.empty?
        end
      end
    end
  end
end
