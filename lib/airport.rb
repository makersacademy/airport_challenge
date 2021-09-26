# airport - have capacity, be full
# airport - default capacity that can be overridden
# airport - no take-offs permitted when weather is stormy
# airport - no landings when weather is stormy
# airport - confirm a plane is not at the airport

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def take_off(plane)
    @hangar.include?(plane) ? ((hangar.delete(plane) if landing_permitted)) : (raise StandardError.new "That plane is not in the hangar")
    # plane.plane_is_flying
  end

  def land(plane)
    hangar.append(plane) if landing_permitted && !full? && plane.landed == false
    #plane.plane_has_landed
  end

  def check_plane_in_hangar(plane)
    @hangar.include?(plane)
  end

  private

  def weather
    ["stormy", "fine"].sample
  end

  def landing_permitted
    weather == "fine"
  end

  def full?
    @hangar.length == @capacity
  end

end