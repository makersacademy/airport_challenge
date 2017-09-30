require './lib/plane'
require './lib/weather'

class Airport

  attr_reader :plane

  def land_at_airport(plane)
    puts "Come in to land!"
    @plane = plane
  end

end
