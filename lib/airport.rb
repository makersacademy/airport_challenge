require_relative 'weather'

class Airport
  attr_accessor :planes, :capacity, :airport_code, :safe_to_fly?

  # include Weather

  DEFAULT_CAPACITY = 20

  def initialize(airport_name = "Heathrow", capacity = DEFAULT_CAPACITY)
    @name = airport_name
    @capacity = capacity
    @planes = []
    @safe_to_fly = safe_to_fly?
  end

  def land_plane(plane)
    fail "Too Stormy to land" if @safe_to_fly == false

    fail "Airport is full" if at_capacity?

    @planes.push(plane)
    puts "#{plane} landed safely."
  end

  def take_off_plane(plane)
    fail "Too Stormy to take off" if @safe_to_fly == false

    @planes.delete(plane)
    plane.status = "Flying"
    puts "#{plane} took off successfully."
  end

private
  def at_capacity?
    @planes.length >= @capacity
  end

end
