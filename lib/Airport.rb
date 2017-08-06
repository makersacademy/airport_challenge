

class Airport
  attr_reader :planes, :capacity, :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane, airborne = true)
    raise "Airport full" if full?
    raise "Plane not in the air" unless airborne
    raise "This plane has already landed at this airport" if @planes.include?(plane)
    raise "Stormy weather - plane can not land" if bad_weather?
    @planes << plane
    puts "Flight #{plane} has landed"
    plane
  end

  def depart(plane)
    raise "This plane is not at this airport" unless @planes.include?(plane)
    raise "Stormy weather - flights suspended" if bad_weather?
    @planes.delete(plane)
    puts "Flight #{plane} has left the airport"
  end

  def show_planes
    @planes
  end

  def stock_planes(n = @capacity)
    n.times { @planes << Plane.new }
    "#{n} new plane#{"s" if n > 1} have arrived at the airport"
  end

  def bad_weather?
    @weather.stormy?
  end

  private
  def full?
    @capacity == @planes.length
  end

end
