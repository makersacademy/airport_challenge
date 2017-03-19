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
    @take_off = true
    if weather == 6
      @take_off = false
    end
    return @take_off
  end

end
