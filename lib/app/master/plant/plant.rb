module Twfarm
  module Master
    class Plant
      @@plants = []
      def self.all_hash
        YAML.load_file("#{__dir__}/data.yml").map{|row|
          [row["type_id"], row]
        }.to_h
      end
    end
  end
end
