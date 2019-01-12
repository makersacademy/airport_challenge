require_relative 'plane'

module Weather
    def current_weather?
    return "sunny" if rand.(1..10).between?(1, 8)
    "stormy"
  end

end


class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "This plane has already landed" if @planes.include?(plane)
    @planes << plane
    @planes
  end


  def take_off(plane)
    #fail ''
    @planes.delete(plane)
  end

end
