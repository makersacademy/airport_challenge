class Airport
  attr_reader :name, :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane, weather, landed = true)
    fail "Sorry plane has already landed!" if @planes.include? plane
    fail "Sorry, too stormy to land!" if weather.stormy?
    fail "Sorry airport is full!" if @planes.length == DEFAULT_CAPACITY
    plane.landed = landed
    @planes << plane
  end

  def take_off(plane, weather)
    fail "Sorry, no planes!" if @planes.empty?
    fail "Sorry, too stormy to take off!" if weather.stormy?
    plane.landed = false
    @planes.delete(plane)
  end

end
