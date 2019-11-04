class Airport
  DEFAULT_CAPACITY = 40
  attr_reader :hangar, :capacity, :airport_id
  attr_writer :full, :hangar
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @stormy = rand(9) <= 2
    @full = false
    @capacity = capacity
    @airport_id = object_id
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
