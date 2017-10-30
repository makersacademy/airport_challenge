class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Too stormy to land!" if @weather.stormy?
    raise "Airport is currently full!" if full?
    raise "Cannot land plane that is not flying!" unless plane.flying?
    plane.change_status
    @planes << plane
  end

  def takeoff(plane)
    raise "Too stormy to takeoff!" if @weather.stormy?
    raise "Plane doesn't exit at this airport!" unless @planes.include?(plane)
    raise "Plane is already aflight!" if plane.flying?
    fly(plane) if @planes.length > 0
    "#{plane} has taken off."
  end

  private

  def fly(plane)
    plane.change_status
    @planes.delete(plane)
  end

  def full?
    @planes.length >= @capacity ? true : false
  end
end
