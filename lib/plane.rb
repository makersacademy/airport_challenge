class Plane
  attr_reader :airport, :previous_airport

  def initialize
    @landed = nil
  end

  def landed?
    @landed
  end

  def fly_to(destination_airport)
    fail "Plane is already in that airport" if destination_airport == airport
    fail "Plane is already flying" if landed? == false
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
  end

  def reset_airports
    @previous_airport = airport
    @airport = nil
  end
end
