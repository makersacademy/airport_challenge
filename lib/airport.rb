require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane,weather)
    raise ("Cannot land planes if the weather if stormy") if weather == "Stormy"
    @planes << plane
  end

  def take_off(plane,weather)
    raise "Cannot take off in stormy weather" if weather == "Stormy"
    planes.delete(plane)
  end

end
