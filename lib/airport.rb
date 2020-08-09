require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off
  	fail 'No planes available' if @planes.length == 0
    plane = @planes.pop
    puts "#{plane} has left the Airport!"
    plane
  end


end
