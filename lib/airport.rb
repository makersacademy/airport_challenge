require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :planes

  def initialize(airport_capacity = 10)
    @weather = Weather.new
    @planes = []
    @capacity = airport_capacity
  end

  def land_plane(plane)
    raise 'Airport at full capacity' if @planes.count >= @capacity
    raise 'The plane is in the airport already' if @planes.include?(plane)
    raise 'Weather conditions are not favourable for landing' if @weather.stormy?
    plane.grounded = true
    @planes << plane
  end

  def take_off(plane)
    raise 'This plane is already in the air' unless plane.grounded?
    raise 'Weather conditions are not favourable for taking off' if @weather.stormy?
    raise "That plane is not in this airport" unless @planes.include?(plane)
    plane.grounded = false
    @planes.delete(plane)
  end

end
