require './plane.rb'
class Airport
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end
  
  def takeoff(plane)
    raise 'No departures due to adverse weather' if bad_weather?

    plane.lift_off
    @hangar.pop    
  end

  def land(plane)
    raise 'Airport is full' if full?
    raise 'No arrivals due to adverse weather' if bad_weather?

    plane.touch_down
    @hangar << plane
  end

  

  private

  def full?
    @hangar.count >= @capacity
  end

  def bad_weather?
    rand(1..5) > 4
  end

end

#airport = Airport.new(100)
#plane = Plane.new
#airport.land(plane)

