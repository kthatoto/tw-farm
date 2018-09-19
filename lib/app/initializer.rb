module Twfarm
  class Initializer

    def initilize
      directory
    end

    private
    def directory
      Dir::chdir(Dir::home)
      unless Dir::exists?(HOME_DIRECTORY)
        Dir::mkdir(HOME_DIRECTORY)
      end
      Dir::chdir(HOME_DIRECTORY)
    end
  end
end
