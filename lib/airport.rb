require "./lib/plane.rb"
require "./lib/weather.rb"

class Airport

  attr_accessor :planes, :plane
  DEFAULT_CAPACITY = 20

  def initialize(default_capacity = DEFAULT_CAPACITY)
    @planes = []
    @default_capacity = default_capacity
  end

  def land(plane)
    raise "Cannot land in stormy weather" if check_current_weather == "stormy"
    raise "Plane has already landed" if plane.status == "arrived"
    raise "Plane is not in the air" if plane.status == nil
    raise "Cannot land, this airport is full" if full?
    move_to_hangar(plane)
  end

  def move_to_hangar(plane)
    plane.status_arrived
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off in stormy weather" if check_current_weather == "stormy"
    raise "this plane is not available for take off or has already left" unless plane.landed?(self)
    leave_hangar(plane)
  end

  def leave_hangar(plane)
    plane.status_departed
    @planes.delete_at(@planes.index(plane))
  end

  def confirm_status(plane)
    plane.status
  end

  def full?
    @planes.count == DEFAULT_CAPACITY ? true : false
  end

  def check_current_weather
    Weather.new.current_weather
  end

end
