require_relative 'plane'

class Airport
  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    raise "plane canot take off due to stormy weather" if weather.storm?
    @planes.delete(plane)
    puts "#{plane} is no longer in the aiport"
  end

end
