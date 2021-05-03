require "./lib/airplane.rb"

class Airport
  #attr_reader airplane

  def initialize
    @airplanes = []
    #@capacity = DEFAULT_CAPACITY
  end
  
  def land(airplane)
    @airplanes << airplane
  end
  
  def take_off
    @airplanes.pop
  end
end