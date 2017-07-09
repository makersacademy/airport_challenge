DEFAULT_CAPACITY = 5

class Airport

  attr_reader :name, :weather, :capacity, :planes

  def initialize(name, weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @name = name
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def add_plane(plane)
    fail_if_full
    @planes << plane
  end

  def delete_plane(plane)
    @planes.reject! { |current_plane| current_plane.object_id == plane.object_id }
  end

  private
  def fail_if_full
    fail "Cannot land, airport is full" if planes.count == capacity
  end

end
