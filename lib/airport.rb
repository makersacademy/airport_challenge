require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :hangar
  attr_accessor :capacity

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Cannot land plane: weather is stormy" if stormy?
    fail "Cannot land plane: airport is full" if full?
    add_plane(plane)
  end

  def confirm_landed(plane)
    if at_airport?(plane)
      "#{plane} has landed at airport"
    else
      "#{plane} has not landed at airport"
    end
  end

  def at_airport?(plane)
    @hangar.include?(plane)
  end

  def take_off(plane)
    fail "Cannot take-off: weather is stormy" if stormy?
    fail "Cannot take-off: plane not at this airport" unless at_airport?(plane)
    remove_plane(plane)
  end

  def confirm_departed(plane)
    if at_airport?(plane)
      "#{plane} has not departed airport"
    else
      "#{plane} has departed airport"
    end
  end

  private

  attr_reader :weather

  def full?
    hangar.count >= capacity
  end

  def stormy?
    weather.stormy?
  end

  def add_plane(plane)
    hangar << plane
  end

  def remove_plane(plane)
    hangar.pop
  end

  def at_airport?(plane)
    hangar.include?(plane)
  end

end