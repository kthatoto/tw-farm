module Twfarm
  class Seeds < Thor::Group

    def seeds
      Twfarm.twputs "seeds"
    end
  end
end
