require_relative 'plane'

class Airport

  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if @planes.count >= 6
    fail 'Stormy cannot take_off' if weather == 'stormy'
    @planes << plane
    plane.land
  end

  def take_off(plane)
    fail 'Stormy cannot take_off' if weather == 'stormy'
    @planes.delete(plane)
    # better to use delete rather than @planes.pop
    # because delete releases the plane in the
    # take_off method whereas pop will release
    # the last plane inserted - and there may not
    plane.take_off
  end

  def weather
    if rand(10) == 1
      'stormy'
    else 'sunny'
    end
  end

end

# private method to put stormy and sunny in an array

