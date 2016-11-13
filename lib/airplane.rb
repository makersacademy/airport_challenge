require_relative "airport.rb"

class Airplane

  attr_accessor :landed


  def initialize
    @landed = true
  end

  def take_off(airport)
    if airport.is_ok_to_take_off?
      @landed = false
    else
      @landed = true
    end
  end

  def land(airport)
    if airport.is_ok_to_land?
      @landed = true
    else
      @landed = false
    end
  end

end
