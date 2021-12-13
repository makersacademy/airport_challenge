require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :hangar, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.weather_forecast)
    @capacity = capacity
    @hangar = []
    @weather = weather
  end

  def takeoff(plane)
    raise 'No clearance for takeoff: Stormy weather' if stormy?
    raise 'No clearance for takeoff: Object is not a plane' unless plane.class == Plane
    raise 'No clearance for takeoff: Plane is not in hangar' unless hangar.include?(plane)
    plane.takeoff
    hangar.delete(plane)
  end

  def confirm_takeoff(plane)
    raise 'Alert: Plane has not taken off' if hangar.include?(plane)
    print 'Plane has successfully taken off'
  end

  def full?
    hangar.size >= capacity
  end

  def stormy?
    weather == :stormy
  end

  def land(plane)
    raise 'No clearance to land: Airport is full' if full?
    raise 'No clearance to land: Stormy weather' if stormy?
    raise 'No clearance to land: Plane isn\'t in flight' unless plane.flying?
    raise 'No clearance to land: Object is not a plane' unless plane.class == Plane
    plane.land
    hangar << plane
  end
end
