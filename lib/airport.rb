class Airport
  attr_reader :name, :planes, :capacity, :weather

  DEFAULT_CAPACITY = 20

  def initialize(name, capacity = DEFAULT_CAPACITY) # pass weather = Weather.new
    @name = name
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  # put weather into initialize as now whenever stormy? is called it runs a new weather
  def land_plane(plane)
    fail "Sorry plane has already landed!" unless left?(plane)
    fail "Sorry, too stormy to land!" if stormy?
    fail "Sorry airport is full!" if full?
    plane.land
    planes << plane
  end

  def take_off(plane)
    fail "Sorry, no planes!" if planes.empty?
    fail "Sorry, too stormy to take off!" if stormy?
    plane.take_off
    planes.delete(plane)
  end

  private

  def full?
    planes.length == DEFAULT_CAPACITY
  end

  def left?(plane)
    !planes.include?(plane)
  end

  def stormy?
    weather.stormy?
  end

end
