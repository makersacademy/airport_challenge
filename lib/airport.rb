class Airport
  attr_accessor :current_aircraft, :capacity, :airport_code, :safe_to_fly

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @current_aircraft = []
  end

  def land_plane(plane)
    raise "Too Stormy to land" if safe_to_fly? == false
    raise "Airport is full" if at_capacity?
    @current_aircraft.push(plane)
  end

  def take_off_plane(plane)
    raise "Too Stormy to take off" if safe_to_fly? == false
    @current_aircraft.delete(plane)
  end

private

  def at_capacity?
    @current_aircraft.length >= @capacity
  end

  def safe_to_fly?
    (rand 10) <= 8
  end

end
