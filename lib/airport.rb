require_relative 'plane'
require_relative 'weather'

class Airport


  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    raise "Can't land plane :( " if @weather.stormy?
    @planes << plane
    return @planes
    puts "#{plane} has landed"
  end

  def take_off
    plane = @planes.pop
    return plane
    puts "#{plane} has taken off"
  end


end
