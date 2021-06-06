require "./lib/plane.rb"

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
    @planes.delete(plane)
    # @planes.pop will only remove the last added elem in array
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
# p airport.confirm_takeoff(Plane.new)
