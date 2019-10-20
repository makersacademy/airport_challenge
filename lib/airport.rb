class Airport
  DEFAULT_CAPACITY = 40
  attr_reader :hangar, :capacity, :airport_id
  attr_writer :stormy, :full
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @stormy = [1,0].sample
    @full = false
    @capacity = capacity
    @airport_id = self.object_id
  end

  def land(plane)
    fail "Can't land due to stormy weather!" if stormy?
    fail "Can't land, hangar is full!" if @hangar.length >= @capacity
    fail "Plane already in airport!" if in_airport?(plane)
    
    @hangar << plane
    plane.change_status(@airport_id, false)
    return plane
  end

  def take_off(plane)
    fail "Can't take off due to stormy weather!" if stormy?
    fail "This plane is already flying" if plane.flying?
    fail "This plane is not at this airport, cant take off" unless plane.current_airport == @airport_id

    @hangar.delete(plane)
    plane.change_status("", true)
    return plane
  end

  def in_airport?(plane)
    return @hangar.include?(plane)
  end

  def stormy?
    if @stormy == 1
      return true
    else
      return false
    end
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