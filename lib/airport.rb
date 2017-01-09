require './lib/airplane.rb'
require './lib/weather.rb'


class Airport

attr_reader :landed_planes
attr_reader :capacity
attr_accessor :initialize

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
    #@stormy = weather_generator
  end

  def land_plane(plane)
    stormy?
    full?
    @landed_planes << plane
    #print "The plane has landed."
    print_landing
  end

  def takeoff
    stormy?
    full?
    @landed_planes.pop
    print_takeoff
  end

  def print_landing
    "The plane has landed"
  end

  def print_takeoff
    "The plane has left"
  end

  def check
    Weather.new.weather_generator
  end

  def stormy?
    fail "Storm preventing takeoff and landing." if check
  end

  def full?
    fail 'airport is full' if @landed_planes.count >= @capacity
  end
end
