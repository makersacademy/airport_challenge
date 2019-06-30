require_relative 'weather'

class Airport
  attr_accessor :current_aircraft, :capacity, :airport_code, :safe_to_fly

  include Weather

  DEFAULT_CAPACITY = 20

  def initialize(airport_name = "Heathrow", capacity = DEFAULT_CAPACITY)
    @name = airport_name
    @capacity = capacity
    @current_aircraft = []
    @safe_to_fly = safe_to_fly?
  end

  def land_plane(plane)
    raise "Too Stormy to land" if @safe_to_fly == false

    raise "Airport is full" if at_capacity?

    @current_aircraft.push(plane)
    # puts "#{plane} landed safely."
  end

  def take_off_plane(plane)

    raise "Too Stormy to take off" if @safe_to_fly == false

    @current_aircraft.delete(plane)
    # puts "#{plane} took off successfully."
  end
  
private
  def at_capacity?
    @current_aircraft.length >= @capacity
  end

end
