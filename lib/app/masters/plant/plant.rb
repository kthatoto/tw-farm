module Twfarm
  module Master
    class Plant
      @@plants = []
      def self.all_hash
        YAML.load_file("#{__dir__}/data.yml").map{|row|
          [row["id"], row]
        }.to_h
      end
    end
  end
end
