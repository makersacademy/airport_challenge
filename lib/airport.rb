class Airport
  attr_reader :name, :planes, :capacity, :weather

  DEFAULT_CAPACITY = 20

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane, weather, landed = true)
    @weather = weather
    fail "Sorry plane has already landed!" unless left?(plane)
    fail "Sorry, too stormy to land!" if stormy?
    fail "Sorry airport is full!" if full?
    plane.landed = landed
    @planes << plane
  end

  def take_off(plane, weather)
    @weather = weather
    fail "Sorry, no planes!" if @planes.empty?
    fail "Sorry, too stormy to take off!" if stormy?
    plane.landed = false
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length == DEFAULT_CAPACITY
  end

  def left?(plane)
    !@planes.include?(plane)
  end

  def stormy?
    @weather = weather.stormy?
  end

end
