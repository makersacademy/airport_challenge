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
    if full
      raise "The airport is full. You must land somewhere else"
    elsif @landing_strip.include?(plane)
      raise "This plane has already landed"
    elsif @weather.stormy?
      raise "The weather is too stormy. You cannot land now."
    else
    @landing_strip << plane
    end
  end

  def take_off(plane)
    if empty
      raise "There are no planes here"
    elsif @landing_strip.include?(plane) == false
      raise "This plane is already airborne"
    else
    @landing_strip.delete(plane)
    end
  end

private

  def empty
    @landing_strip.empty?
  end

  def full
    @landing_strip.count >= capacity
  end

end
