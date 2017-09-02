require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  def initialize
    @planes = []
  end

  def landing(plane)
    @planes << plane
  end

end
