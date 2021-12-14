require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :hangar, :weather

  def initialize(capacity=DEFAULT_CAPACITY, weather = Weather.weather_forecast)
    @capacity = capacity
    @hangar = []
    @weather = weather
  end

  def takeoff(plane)
    raise 'No clearance for takeoff: Plane is not at airport' unless hangar.include?(plane)
    raise 'No clearance for takeoff: Stormy weather' if stormy?
    hangar.delete(plane)
    plane.takeoff
  end

  def confirm_takeoff(plane)
    raise 'Alert: Plane is still in hangar' if hangar.include?(plane)
    print "#{plane} has successfully taken off"
  end

  def full?
    hangar.size >= capacity
  end

  def stormy?
    weather == :stormy
  end

  def land(plane)
    clearance_to_land(plane)
    hangar << plane
    plane.land
  end

  def clearance_to_land(plane)
    raise 'No clearance to land: Airport is full' if full?
    raise 'No clearance to land: Stormy weather' if stormy?
    raise 'No clearance to land: Plane is not in flight' if plane.flying? == false
    raise 'No clearance to land: Object is not a plane' unless plane.class == Plane
  end
end