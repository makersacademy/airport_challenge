

class Airport
  attr_reader :planes, :capacity, :weather

  $DEFAULT_CAPACITY = 10

  def initialize(capacity = $DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane, airborne = true)
    raise "Airport full" if full?
    raise "Plane not in the air" unless airborne
#    raise "Stormy weather - plane can not land" if weather.stormy?
    @planes << plane
    plane
  end

  def depart(plane)
#    raise "Stormy weather - flights suspended" if weather.stormy?
    @planes.delete(plane)
    "Flight #{plane} has just departed"
  end

  def show_planes
    @planes
  end


  def stock_planes(n = @capacity) # the default is max capacity
     n.times { @planes << Plane.new }
     "#{n} new plane#{"s" if n > 1} have arrived at the airport"
  end

  # def bad_weather?
  #
  # end


  private

  def full?
    @capacity == @planes.length
  end

end
