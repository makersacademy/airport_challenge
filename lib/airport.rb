require_relative './plane.rb'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
    plane.flying = false
  end

  def take_off(plane)
    fail "No plane at the airport" if @planes.empty?
    fail "No plane at the airport" unless plane.flying == false
    plane.flying = true
    "#{plane} has left the airport"
  end

end
