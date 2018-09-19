module Twfarm
  class Test < Thor::Group

    def test
      pp `pwd`
    end
  end
end
