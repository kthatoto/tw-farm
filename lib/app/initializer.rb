module Twfarm
  class Initializer

    def initilize
      create_home_directory
      move_home_directory
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
  end
end
