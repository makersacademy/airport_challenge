require './docs/plane.rb'
require './docs/weather.rb'

class Airport

attr_accessor :planes

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    planes << plane
  end

  def confirm_land(plane)
    planes.include?(plane)
  end

  def take_off(plane)
    planes.delete(plane)
  end

  def confirm_take_off(plane)
    !planes.include?(plane)
  end

end
