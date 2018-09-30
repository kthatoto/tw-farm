module Twfarm
  class Initializer

    def initialize
      create_home_directory
      move_home_directory
      DB.new
      user_initialize
    end

    private
    def create_home_directory
      unless Dir::exists?("#{Dir::home}/#{HOME_DIRECTORY}")
        Dir::mkdir("#{Dir::home}/#{HOME_DIRECTORY}")
      end
    end
    def move_home_directory
      Dir::chdir("#{Dir::home}/#{HOME_DIRECTORY}")
    end

    def user_initialize
      $user = User.first
      unless $user
        User.create
        $user = User.first
        setup_data
      end
    end
    def setup_data
      Seed.create(
        plant_id: 1, level: 1,
        size_potential: 1, growth_potential: 1,
        max_seeds_number: 2, min_seeds_number: 1
      )
      Seed.create(
        plant_id: 1, level: 2,
        size_potential: 1, growth_potential: 1,
        max_seeds_number: 2, min_seeds_number: 1
      )
      Seed.create(
        plant_id: 2, level: 1,
        size_potential: 1, growth_potential: 1,
        max_seeds_number: 2, min_seeds_number: 1
      )
      Field.create(space: 100)
      Larder.create(level: 1, capacity: 100)
    end
  end
end
