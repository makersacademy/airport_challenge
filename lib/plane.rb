class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def flying= (flying)
    @flying = flying
  end

  def land (airport)
    #check the plane isn't already landed, fail if so
    #fail 'Already landed!' if not flying?
    #order the airport to accept the plane, change plane condition according to response
    @flying =not(airport.land self)

  end

  def launch
    # This entire model is messy. Airports and plans duplicate information in order
    # to prevent dependencies
    fail 'Already flying!' if flying?
  end

end
