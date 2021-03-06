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
  def self.twputs_error(o, indent = 0)
    print reden($preword)
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

  def self.rgb o, background_color, font_color
    "\e[48;2;#{background_color}m\e[38;2;#{font_color}m#{o}\e[0m"
  end


end
