require_relative 'weather'

class Airport
  attr_reader :planes, :weather
  attr_accessor :capacity
  DEFAULT_CAPACITY = 5

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "Plane has already landed" if planes.include?(plane)
    raise "Airport is full" if full?
    raise "It is too stormy to land" if weather.stormy?
    plane.status = "At airport"
    planes << plane
  end

  def take_off(plane)
    raise "No planes available" if empty?
    raise "Plane is already in the air" unless planes.include?(plane)
    raise "It is too stormy to take off" if weather.stormy?
    plane.status = "In air"
    planes.delete(plane)
  end

  private

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end
