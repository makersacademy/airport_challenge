require_relative 'plane'
require_relative 'weather'

class Airport
  MAX = 5


  def initialize(capacity = MAX)
    @capaccity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    raise "Can't land plane :( " if @weather.stormy?
    unless @planes = []
      raise "Airport is full" if full?
    end
    @planes << plane
    return @planes
    puts "#{plane} has landed"
  end

  def take_off
    plane = @planes.pop
    return plane
    puts "#{plane} has taken off"
  end

private

def full?
  @planes.length >= capacity
end

end
