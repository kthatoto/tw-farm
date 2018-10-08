module Twfarm
  class Plant < Thor::Group

    def plant
      seed_option_index = ARGV.index("--seed-id")
      field_option_index = ARGV.index("--field-id")
      unless seed_option_index && field_option_index
        Twfarm.twputs_error "seed_id and field_id is required..."
      end
    end
  end
end
