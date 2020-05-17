require './lib/plane.rb'
class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :hangar, :capacity
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end
  
  def takeoff(plane)
    raise 'No departures due to adverse weather' if bad_weather?
    raise 'Plane is already in the air' if plane.flying?

    out_hangar_and_takeoff(plane)
  end

  def land(plane)
    landing_possible_checks(plane)
    land_and_store(plane)

  end

  private

  def full?
    hangar.count >= capacity
  end

  def bad_weather?
    rand(1..5) > 4
  end

  def landing_possible_checks(plane)
    raise 'Airport is full' if full?
    raise 'No arrivals due to adverse weather' if bad_weather?
    raise 'Plane must be flying to land' unless plane.flying?
  end

  def land_and_store(plane)
    plane.touch_down
    hangar << plane
  end

  def out_hangar_and_takeoff(plane)
    plane.lift_off
    hangar.delete(plane)  
  end
end
