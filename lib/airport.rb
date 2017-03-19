require_relative 'weather'

class Airport

  attr_reader :landing_strip, :capacity, :weather
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @landing_strip = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    fail "This plane has already landed" if already_in_airport?(plane)
    fail "The airport is full. You must land somewhere else" if full?
    fail "The weather is too stormy. You cannot land now." if stormy?
    landing_strip << plane
  end

  def take_off(plane)
    fail "There are no planes here" if empty?
    fail "This plane is already airborne" if already_airborne?(plane)
    fail "The weather is too stormy for take off" if stormy?
    landing_strip.delete(plane)
  end


private

  def already_in_airport?(plane)
    landing_strip.include?(plane)
  end

  def already_airborne?(plane)
    landing_strip.include?(plane) == false
  end

  def stormy?
    weather.stormy?
  end

  def empty?
    landing_strip.empty?
  end

  def full?
    landing_strip.count >= capacity
  end

end
