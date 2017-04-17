require 'plane.rb'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes
  attr_accessor :weather

  def initialize(y = DEFAULT_CAPACITY)
    @planes = []
    # Weather is good when set to '1' and stormy when '0'
    @weather = rand_weather
    @capacity = y
  end

  def land_plane(plane = Plane.new)
    raise ArgumentError, "Airport Full!", caller if @planes.count == @capacity
    weather?
    @planes << plane
  end

  def plane_take_off
    raise ArgumentError, "Airport Empty!", caller if @planes.count.zero?
    weather?
    @planes.pop
  end

  def weather?
    raise ArgumentError, "Weather Stormy!", caller if @weather.zero?
  end

  def rand_weather
    if rand(1..5) == 1; 0
    else 1
    end
  end

  private :rand_weather, :weather?

end
