class Airport
  attr_reader :planes, :capacity, :weather

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport is full, cannot land!" if full?
    raise "Weather is stormy, cannot land!" if @weather == "stormy"

    plane.arrive
    @planes << plane
  end

  def take_off(plane)
    raise "Plane already departed!" if plane.departed
    raise "Weather is stormy, cannot take off!" if @weather == "stormy"

    return unless @planes.include?(plane)

    plane.depart
    @planes - [plane]
    # @planes.pop will only remove the last added elem in array
    # @planes.delete(plane) is another solution
  end

  def confirm_takeoff(plane)
    !@planes.include?(plane)
  end

  def weather_report
    @weather = ["sunny", "stormy", "sunny"].sample
  end

  private

  def full?
    @planes.size >= @capacity
  end
end

# airport = Airport.new
# airport.take_off("plane")
# airport.weather_report
