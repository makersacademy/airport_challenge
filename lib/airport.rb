class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def take_off(plane)
    raise StandardError.new "That plane is not in the hangar" unless @hangar.include?(plane)
    (hangar.delete(plane) && plane.plane_is_flying) if landing_permitted?
  end

  def land(plane)
    return unless landing_permitted?
    return if full?
    return if plane.landed

    (hangar.push(plane) && plane.plane_has_landed)
  end

  def plane_in_hangar?(plane)
    @hangar.include?(plane)
  end

  def weather
    ["stormy", "fine"].sample
  end

  def landing_permitted?
    weather == "fine"
  end

  private

  def full?
    @hangar.length == @capacity
  end

end
