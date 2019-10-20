class Airport
  DEFAULT_CAPACITY = 40
  attr_reader :hangar, :capacity, :airport_id
  attr_writer :full, :hangar
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @stormy = rand(10) <= 3
    @full = false
    @capacity = capacity
    @airport_id = object_id
  end

  def receive(plane)
    fail "Can't land due to stormy weather!" if stormy?
    fail "Can't land, hangar is full!" if @hangar.length >= @capacity
    fail "Plane already in airport!" if in_airport?(plane)
    
    @hangar << plane
    plane.change_status(@airport_id, false)
    return plane
  end

  def allow_take_off(plane)
    fail "Can't take off due to stormy weather!" if stormy?
    fail "This plane is already flying" if plane.flying?
    fail "This plane is not at this airport" unless plane.airport == @airport_id

    @hangar.delete(plane)
    plane.change_status("", true)
    return plane
  end

  def in_airport?(plane)
    return @hangar.include?(plane)
  end

  def stormy?
    return @stormy
  end

  def full?
    @full = (@hangar.length >= capacity)
  end

end
