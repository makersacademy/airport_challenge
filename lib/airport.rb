require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 30
  WEATHER_RANDOMISER = rand(10)
  attr_accessor :runway , :capacity , :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @runway = []
    @capacity = capacity
    if WEATHER_RANDOMISER >= 9
      @weather = 'stormy'
    else
      @weather = 'sunny'
    end
  end

  def land(plane)
    fail 'Cannot land in stormy weather' if @weather == 'stormy'
    fail 'Cannot land when airport is full' if full?
    @runway << plane
  end

  def take_off(plane)
    fail 'Cannot take off in stormy weather' if @weather == 'stormy'
    @runway.delete(plane)
  end

  def report_stormy
    @weather = "stormy"
  end

  def full?
    @runway.count >= @capacity
  end

  def empty?
    @runway.empty?
  end
end
