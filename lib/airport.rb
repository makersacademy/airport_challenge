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
    @weather = Weather.new.instance_variable_get(:@weather)
    fail ("Takeoff not possible, as no planes present") if empty?
    fail ("Takeoff not possible due to stormy weather") if @weather == "Stormy"
    @planes.pop
  end

  def land(plane)
    @weather = Weather.new.instance_variable_get(:@weather)
    fail "Landing not possible due to stormy weather" if !full? && @weather == "Stormy"
    fail "Landing not possible. This airport is full." if full? && @weather == "Sunny"
    @planes << plane
  end

private

  def empty?
    @planes.empty?
  end

  def full?
    if @planes.count >= @capacity
      true
    else
      false
    end
  end
end
