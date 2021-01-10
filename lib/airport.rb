require_relative "airplane"
require_relative "weather"

class Airport

  attr_accessor :capacity
  attr_accessor :airplanes 
  attr_reader :weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @airplanes = Array.new
    @capacity = capacity
    @weather = Weather.new
  end

  def land(airplane)
    fail "Airport is full" if full?
    fail "Cannot land due to stormy weather" if @weather.stormy?

    @airplanes.push(airplane)
   
  end

  def take_off
    fail "No airplanes at airport" if empty?
    fail "Cannot take off due to stormy weather" if @weather.stormy?

    "#{@airplanes.pop} has taken off"
  end

private

  def full?
    @airplanes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @airplanes.empty?
  end

end
