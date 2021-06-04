class Airport
  attr_accessor :planes, :capacity, :weather

  def initialize(capacity = 50)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport is full!" if full?
    @planes << plane
  end

  def take_off(plane)
    @weather == "stormy" ? (raise "Weather is stormy, cannot take off!") : @planes.pop
    @planes
  end

  def confirm_takeoff(plane)
    @planes.include?(plane)
  end

  def weather_report
    @weather = ["sunny", "stormy", "sunny", "sunny"].sample
  end

  private

  def full?
    @planes.size >= @capacity
  end
end

airport = Airport.new
# airport.take_off("plane")
airport.weather_report
