require_relative 'plane'
require_relative 'weather'
class Airport

 DEFAULT_CAPACITY = 10

 def initialize (capacity = DEFAULT_CAPACITY)
   @planes = []
   @capacity = capacity
 end

 def land(plane)
    raise "The airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "Flight cancelled due to bad weather" if bad_weather?
    fail "No planes at the airport" if empty?
    @planes.pop
  end

  private

  attr_reader :capacity, :planes

  def bad_weather?
    weather.stormy?
  end

  def weather
    @weather ||= Weather.new
  end

  def full?
    planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end


end
