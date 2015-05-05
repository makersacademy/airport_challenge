require_relative 'plane'

class Airport

  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if @planes.count >= 6
    @planes << plane
    plane.land
    fail 'Stormy cannot land' if weather == 'stormy'
  end

  def take_off(plane)
    fail 'Do not take_off' if weather == 'stormy'
    @planes.delete(plane)
    plane.take_off
  end

  def weather
    if rand(10) == 1
      return'stormy'
    else 'sunny'
    end
  end

end



