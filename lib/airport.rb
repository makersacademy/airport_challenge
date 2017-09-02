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
    stormy? ? "Storm!" : @@runway.delete(plane)

    # if @@runway == []
    #   "No planes to take off"
    # end
  end

  def stormy?
    storm_conditions = [true,false]
    stormy = storm_conditions.sample

  end

end
