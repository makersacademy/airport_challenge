require "weather.rb"

class Plane

  include Weather

  def initialize
    @land = true
  end

  def landed?
    @land
  end

  def start_landing
    true
  end

  def take_off
    @land = false
    @take_off = weather == 6 ? false : true
    return @take_off
  end

end
