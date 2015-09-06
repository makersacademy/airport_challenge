class Plane

  attr_reader :location, :flying

  def initialize
    @flying = true
  end

  def land(airport)
    if airport.allow_landing?
      @flying = false
      @location = airport
    else
      "Airport refuses landing request"
    end
  end

  def take_off
    @flying = true
    @location = nil
  end

  def landed?
    !flying
  end

  def flying?
    flying
  end

end
