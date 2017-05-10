require './lib/weather'

class Airport
  attr_reader   :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 3

  def initialize
    @parked_planes = []
    @en_route_planes = []
    @weather = Weather.new
    @capacity = DEFAULT_CAPACITY
  end

  def park(plane)
    raise "The plane has been already parked" if @parked_planes.include? plane
    raise 'The plane is en route' if @en_route_planes.include?(plane)

    @en_route_planes.delete(plane)
    @parked_planes << plane
  end

  def en_route(plane)
    @parked_planes.delete(plane)
    @en_route_planes << plane
    plane
  end

  def parked?(plane)
    @parked_planes.include? plane
  end

  def en_route?(plane)
    @en_route_planes.incude? plane
  end

  def full?
    @parked_planes.count >= capacity
  end

end
