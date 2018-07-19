require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather

  def initialize(weather_class, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather_class.new
    @stormy = @weather.stormy?
  end

  def land(plane)
#    fail 'There is a storm, cannot land plane' if @stormy
    fail 'Cannot land plane: Airport full' if full?
    @planes << plane
  end

  def launch(plane)
#    fail 'There is a storm, cannot launch plane' if @stormy
    fail 'Airport is empty' if empty?
    @planes.pop
  end

  private

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.count.zero?
  end
end
