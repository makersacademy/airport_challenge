require_relative 'plane'

class Airport
  def initialize(capacity = 10)
    @capacity = capacity
    @terminal = []
  end

  attr_reader :terminal

  def stormy
    true if rand(10) == 1
    false
  end

  def safe_to_land(plane)
    raise("#{plane} is already at the airport") if @terminal.include?(plane)
    raise("#{plane} is not flying.") unless plane.flying
  end

  def land_plane(plane)
    safe_to_land(plane)
    return "#{plane} cannot land. #{self} is at capacity." if airport_full?
    return "#{plane} cannot land. Weather is too stormy." if stormy
    @terminal << plane
    plane.flying = false
  end

  def safe_to_take_off(plane)
    raise("#{plane} is not at this airport") unless @terminal.include?(plane)
  end

  def take_off(plane)
    safe_to_take_off(plane)
    return "#{plane} cannot take off. Weather is too stormy." if stormy
    @terminal.delete(plane)
    plane.flying = true
    "#{plane} has left the #{self}"
  end

  private
  def airport_full?
    @terminal.length >= @capacity
  end

end
