module Twfarm
  $preword = "termworld> "
  def self.twputs(o, indent = 0)
    print bluen($preword)
    print " " * 2 * indent if indent > 0
    puts o
  end
  def self.tweputs(o, indent = 0)
    print " " * $preword.length
    print " " * 2 * indent if indent > 0
    puts o
  end

  def self.reden o
    "\e[31m#{o}\e[0m"
  end

  def self.greenen o
    "\e[32m#{o}\e[0m"
  end

  def self.yellowen o
    "\e[33m#{o}\e[0m"
  end

  def self.bluen o
    "\e[34m#{o}\e[0m"
  end

  def self.purplen o
    "\e[35m#{o}\e[0m"
  end

  def self.skybluen o
    "\e[36m#{o}\e[0m"
  end

  def self.underlinen o
    "\e[4m#{o}\e[0m"
  end

  def self.rgb o
    "\e[38;2;81;178;76m\e[48;2;255;255;255m#{o}\e[0m"
  end


end
