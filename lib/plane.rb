class Plane
  attr_reader :airport, :previous_airport

  def initialize
    @landed = nil
  end

  def landed?
    @landed
  end

  def flying?
    landed? == false
  end

  def fly_to(destination_airport)
    fail "NEW PLANE! Assign the plane to an airport first: airport.land(plane)" if landed?.nil?
    fail "Plane is already in that airport" if destination_airport == airport
    fail "Plane is already flying" if landed? == false
    fail "Can't take off - weather is stormy!" if airport.weather == :stormy
    take_off(destination_airport)
  end

  private

  def set_airport(airport)
    @airport = airport
    set_as_landed
  end

  def set_as_landed
    @landed = true
  end

  def set_as_flying
    @landed = false
  end

  def take_off(destination_airport)
    set_as_flying
    reset_airports
    previous_airport.send(:take_off, self, destination_airport)
    "Plane has successfully landed at destination."
  end

  def reset_airports
    @previous_airport = airport
    @airport = nil
  end
end
