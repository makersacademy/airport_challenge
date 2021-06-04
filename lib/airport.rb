class Airport
  attr_accessor :planes, :capacity, :weather

  def initialize(capacity = 50)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport is full, cannot land!" if full?
    raise "Weather is stormy, cannot land!" if @weather == "stormy"

    @planes << plane
  end

  def take_off(plane)
    raise "Weather is stormy, cannot take off!" if @weather == "stormy"

    @planes - [plane]
    # @planes.pop will only remove the last added elem in array
    # @planes.delete(plane) is another solution
  end

  def confirm_takeoff(plane)
    @planes.include?(plane)
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
