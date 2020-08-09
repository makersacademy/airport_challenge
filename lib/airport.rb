require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
  	fail 'Airport Full' if full?
    @planes << plane

  end

  def take_off
  	fail 'No planes available' if @planes.length == 0
    plane = @planes.pop
    puts "#{plane} has left the Airport!"
    plane
  end



  private

  def full?
  	@planes.length >= DEFAULT_CAPACITY
  end

  DEFAULT_CAPACITY = 30


end
