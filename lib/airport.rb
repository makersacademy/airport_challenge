require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  def initialize
    @planes = []
  end

  def landing(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end
end
