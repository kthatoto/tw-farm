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
      end
    end
  end
end
