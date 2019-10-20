class Airport
  DEFAULT_CAPACITY = 40
  attr_reader :hangar, :capacity
  attr_writer :stormy, :full
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @stormy = false
    @full = false
    @capacity = capacity
  end

  def land(plane)
    fail "Can't land due to stormy weather!" if @stormy
    fail "Can't land, hangar is full!" if @hangar.length >= @capacity
    fail "Plane already in airport!" if in_airport?(plane)
    
    @hangar << plane
    plane.current_airport = self.object_id
    plane.flying = false
    return plane
  end

  def take_off(plane)
    fail "Can't take off due to stormy weather!" if @stormy
    fail "This plane is already flying" if plane.flying?

    @hangar.delete(plane)
    plane.flying = true
    plane.current_airport = ""
    return plane
  end

  def in_airport?(plane)
    return @hangar.include?(plane)
  end

  def stormy?
    return @stormy
  end

  def full?
    if @hangar.length >= capacity
      @full = true
    else
      @full = false
    end

    return @full
  end

end