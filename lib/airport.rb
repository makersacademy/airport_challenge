require_relative 'plane'

class Airport
  attr_reader :landed_planes, :weather, :capacity
  attr_writer :weather, :capacity

  def initialize(capacity=5)
    weather_random = rand(1..5) # Pull this out into another method?
    (weather_random == 5) ? @weather = "stormy" : @weather = "clear"
    @capacity = capacity
    @landed_planes = []
  end

  def store_plane(plane)
    fail "Can't land, airport is full" if @landed_planes.length == capacity
    @landed_planes.push(plane)
  end

  def release_plane(plane)
    index_of_plane = @landed_planes.index(plane)
    @landed_planes.delete_at(index_of_plane)
  end

end
