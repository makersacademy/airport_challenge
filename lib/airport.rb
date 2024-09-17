class Airport

  attr_reader :airport_storage
  attr_reader :airport_capacity
  attr_reader :weather
  
  DEFAULT_CAPACITY = 10

  def initialize(airport_capacity = DEFAULT_CAPACITY)
    @airport_storage = []
    @airport_capacity = airport_capacity 
    @weather = Weather.new
  end

  def land_plane(plane)
    fail "Storage full" if full?
    fail "Plane not flying" unless plane.flying?
    fail "Too stormy" if weather.stormy?
    airport_storage.push(plane)
  end

  def send_plane(plane)
    fail "Plane not in storage" unless airport_storage.include? plane
    fail "Plane already flying" if plane.flying?
    fail "Too stormy" if weather.stormy?
    @airport_storage.delete(plane)
  end

  def full?
    return airport_storage.size >= airport_capacity
  end

end
