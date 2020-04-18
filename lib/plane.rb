require_relative 'air_traffic_controller'

class Plane
  attr_reader :flying, :stationary, :airport

  def initialize
    @flying = ""
    @stationary = ""
    @airport = Airport.new
  end

  def take_off(plane = Plane.new)
    raise "This plane (#{plane}) has already taken off" if @flying == true

    @flying = true
    @stationary = false
    "#{plane} has taken off from #{plane.airport}"
  end

  def land(plane)
    raise "This plane (#{plane}) has already landed" if @stationary == true

    @stationary = true
    @flying = false
    "#{plane} has landed"
  end
end
