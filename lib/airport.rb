require_relative 'plane'

class Airport

  def initialize
    @planes = []
    @weather = [:stormy, :sunny, :rain]
  end

  def land(plane)
    raise "Can't land plane :( " if stormy?
    @planes << plane
    return @planes
    puts "#{plane} has landed"
  end

  def take_off
    plane = @planes.pop
    return plane
    puts "#{plane} has taken off"
  end

  def stormy?
    n = rand(0..3)
    true if @weather[n] == :stormy
  end

end
