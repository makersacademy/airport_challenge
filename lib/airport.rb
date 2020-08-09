require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 30
  attr_reader :capacity
  attr_reader :current_conditions

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @current_conditions = Weather.new.generate

  end

  def land(plane)
  	fail 'Airport Full' if full?
    @weather = weather
    fail 'Weather stormy' if current_conditions == "stormy"
    @planes << plane

  end

  def take_off
  	fail 'No planes available' if @planes.count == 0
    plane = @planes.pop
    puts "#{plane} has left the Airport!"
    plane
  end

  private

  def full?
  	@planes.count >= capacity
  end

  def weather
    current_conditions = @weather
  end 

end