require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes, :weather, :capacity

  def initialize(capacity=DEFAULT_CAPACITY, weather = Weather.new)
    @weather = weather
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "The plane can't land when the weather is stormy" if stormy?
    raise "Cannot land plane if airport is full" if full?
    raise "Plane is already landed" if planes.include?(plane)
    raise "The plane has already landed at an airport." if plane.has_landed?
    add(plane)
    confirm_landing(plane)
  end

  def take_off(plane)
    raise "The plane can't take off when the weather is stormy" if stormy?
    raise "The plane has already taken off" unless planes.include?(plane)
    delete(plane)
    confirm_take_off(plane)
  end

  private

  def add(plane)
    planes << plane
    plane.has_landed
  end

  def full?
    planes.count >= capacity
  end

  def stormy?
    @weather.is_stormy?
  end

  def delete(plane)
    planes.delete(plane)
  end

  def confirm_take_off(plane)
    "The plane #{plane} has taken off"  unless planes.include?(plane)
  end

  def confirm_landing(plane)
    "The plane #{plane} has landed" if planes.include?(plane)
  end
end
