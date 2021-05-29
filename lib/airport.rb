class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise 'That plane has already landed.' if parked?(plane)
    raise 'The airport is full, please do not land.' if full?

    hangar << plane
  end

  def take_off(plane)
    raise 'That plane is not at this airport.' unless parked?(plane)
    
    hangar.delete_at(parking_spot(plane))
    hangar
  end

  private

  def parked?(plane)
    hangar.index(plane) != nil
  end

  def parking_spot(plane)
    hangar.index(plane)
  end

  def full?
    hangar.length >= @capacity
  end

end
