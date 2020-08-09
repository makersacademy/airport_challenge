require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 30
  attr_reader :capacity



  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
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
  	@planes.count >= capacity
  end

  def weather?
  end






end