require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  include Weather

  def initialize
    @planes = []
    @weather
  end

  def land(plane)
    @weather = self.generate_weather
    fail "Plane has already landed!" unless plane.landed == false
    fail "The weather is too bad to land." if @weather == "Stormy"
    plane.landed = true
    @planes << plane
  end

  def take_off
    plane = @planes.shift
    plane.landed = false
    puts "#{plane} has taken off from #{self}"
    return plane
  end

end
