class Airport
  attr_reader :hanger
  def initialize
    @hanger = []
  end
  def land(plane)
    fail "Can't land due to stormy weather" if storm
    @hanger << plane
  end
  def take_off
    fail "Can't take off due to stormy weather" if storm
    @hanger.pop
  end
  def taken_off?
    @hanger.length
  end
  def storm
    true if ["stormy", "sunny"].sample == "stormy"
  end
end

#airport = Airport.new
#plane = Plane.new
#puts airport.land(plane)
#puts airport.take_off
