require_relative "weather"
require_relative "plane"

class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def takeoff
    raise "Takeoff not possible due to stormy weather" if !empty? && Weather.new.instance_variable_get(:@weather) == "Stormy"
    raise "Takeoff not possible, as no planes present" if empty? && Weather.new.instance_variable_get(:@weather) == "Sunny"
    @planes.pop
  end

  def land(plane)
    raise "Landing not possible due to stormy weather" if Airport.full? == false && Weather.new.instance_variable_get(:@weather) == "Stormy"
    raise "Landing not possible. This airport is full." if Airport.full? == true && Weather.new.instance_variable_get(:@weather) == "Sunny"
    @planes << plane
  end

  private

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= @capacity
  end
end
