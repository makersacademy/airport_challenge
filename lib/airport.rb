class Airport
  attr_reader :planes, :capacity, :weather

  DEFAULT_CAPACITY = 3

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport is full, cannot land!" if full?
    raise "Weather is stormy, cannot land!" if @weather == "stormy"
    raise "Plane already in airport!" if @planes.include?(plane)

    plane.arrive
    @planes << plane
  end

  def take_off(plane)
    raise "Plane already departed!" if plane.departed? == true
    raise "Weather is stormy, cannot take off!" if @weather == "stormy"

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
