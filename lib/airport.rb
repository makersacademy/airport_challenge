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
    fail "Storm! Do not take off!" if self.stormy? == true
    @@runway.delete(plane)

    # if @@runway == []
    #   "No planes to take off"
    # end
  end

end
