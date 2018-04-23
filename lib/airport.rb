require_relative './weather'
require_relative './plane'
class Airport
  attr_reader :capacity, :planes, :weather
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def take_off(plane)
    fail "The weather is stormy" if weather.stormy?
    fail "This plane is not in this airoport" unless landed(plane)
    @planes.delete(plane)
    puts "#{plane} has took off"
  end

  def land(plane)
    fail "The weather is stormy" if weather.stormy?
    fail "Airport is full" if full?
    @planes << plane
  end

  private
  def landed(plane)
    @planes.include?(plane)
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
