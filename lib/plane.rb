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
    # @start_landing = weather == 6 ? false : true
    @land = true
    @start_landing = true
    if weather == 6
      @start_landing = false
      @land = false
    end
    return @start_landing
  end

  def take_off
    @land = false
    # @take_off = weather == 6 ? false : true
    @take_off = true
    if weather == 6
      @take_off = false
      @land = true
    end
    return @take_off
  end

end
