require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Plane has already landed" if planes.include? plane
    raise "It is too stormy to land" if weather.stormy?
    plane.status = "At airport"
    planes << plane
  end

  def take_off(plane)
    raise "No planes available" if planes.empty?
    raise "Plane is already in the air" unless planes.include?(plane)
    plane.status = "In air"
    planes.delete(plane)
  end

end
