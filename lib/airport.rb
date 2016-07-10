require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  attr_reader :weather
  def initialize
@planes = []
end


def land plane, weather = Weather.new
@planes << plane
"The plane #{plane} has landed"
end

def take_off plane, weather = Weather.new
raise "Weather condition is bad, no take offs" if weather.stormy?
"The plane #{planes.delete plane} has taken off"
end
end
