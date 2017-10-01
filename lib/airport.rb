class Airport
  attr_reader :name, :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane, weather, landed = true)
    fail "Sorry plane has already landed!" if here?(plane)
    fail "Sorry, too stormy to land!" if weather.stormy?
    fail "Sorry airport is full!" if full?
    plane.landed = landed
    plane.airport = @name
    @planes << plane
  end

  def take_off(plane, weather)
    fail "Sorry, no planes!" if @planes.empty?
    fail "Sorry, too stormy to take off!" if weather.stormy?
    plane.landed = false
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length == DEFAULT_CAPACITY
  end

  def here?(plane)
    @planes.include?(plane)
  end
end
