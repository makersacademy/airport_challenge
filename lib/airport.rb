require 'plane.rb'

class Airport
  attr_accessor :parked_planes

  def initialize
    @parked_planes = []
  end

  def park_plane(plane)
    @parked_planes.push(plane)
  end

  def find_plane(plane)
    @parked_planes.index(plane)
  end

  def land(plane, weather)
    if clear_weather?(weather)
      plane.land
    else
      fail 'Weather is too stormy to land!'
    end
  end

  def launch_plane(plane)
    @parked_planes.delete_at(find_plane(plane))
  end

  def takeoff(plane, weather)
    if clear_weather?(weather)
      plane.takeoff
    else
      fail 'Weather is too stormy to take off!'
    end
  end

  def confirm_departure(plane)
    !@parked_planes.include?(plane)
  end

  def clear_weather?(weather)
    weather.report == 'clear'
  end

end
