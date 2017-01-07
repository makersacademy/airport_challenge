require_relative 'air_traffic_controller'
require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def fleet(plane)
    raise "Plane is already on the ground" if @planes.include?(plane)
    @planes << plane
  end

end
