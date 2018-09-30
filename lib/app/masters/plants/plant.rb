module Twfarm
  module Master
    class Plant
      @@plants = []
      # def self.all_hash
      #   YAML.load_file("#{__dir__}/data.yml").map{|row|
      #     [row["id"], row]
      #   }.to_h
      # end
      def self.all
        YAML.load_file("#{__dir__}/data.yml")
      end

      def self.get_by_id(id)
        YAML.load_file("#{__dir__}/data.yml").find{|row|
          row["id"] == id
        }
      end

      def self.get_by_ids(ids)
        YAML.load_file("#{__dir__}/data.yml").select{|row|
          ids.include?(row["id"])
        }
      end
    end
  end
end
