require_relative 'plane'

class Airport
  attr_reader :planes 
  
  def initialize 
    @planes = []
  end

  def land(plane)
    #fail 'Airport full' if @planes
    @planes = plane
  end

  def airport_full(plane)
    fail 'Airport full' if @planes.count >= 20
    @planes << plane

  end

  def take_off
    @planes
  end

#   def stormy_weather
#     true
#   end
end
