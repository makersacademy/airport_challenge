require_relative 'plane'
require_relative 'runway'

class Airport

  include Runway

  def runway_traffic
    @@runway
  end

  def land(plane)
    @@runway << plane unless @@runway.include?(plane)
  end

  def take_off(plane)
    weather = "stormy"
    weather == "stormy" ? "Storm!" : @@runway.delete(plane)
  end

end
