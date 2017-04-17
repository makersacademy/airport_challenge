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
    fail "Takeoff not possible due to stormy weather" if !empty? && @weather == "Stormy"
    fail "Takeoff not possible, as no planes present" if empty? && @weather == "Sunny"
    @planes.pop
  end

  def land(plane)
    @weather = Weather.new.instance_variable_get(:@weather)
    fail "Landing not possible due to stormy weather" if full? == false && @weather == "Stormy"
    fail "Landing not possible. This airport is full." if full? == true && @weather == "Sunny"
    @planes << plane
  end

  def empty?
    @planes.empty?
  end

  def full
    if @planes.count >= @capacity
      true
    else
      false
    end
  end
end
