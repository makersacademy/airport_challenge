class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    @plane = plane
    fail "Airport is full!" if full?
    fail "Cannot land the same plane" if same_plane?
    @planes << plane
    @plane = plane
  end

  def take_off
    fail "no planes available for take-off!" if empty?
    # fail "Cannot take_off the same plane" if
    @planes.pop
  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  def same_plane?
    @planes.include?(@plane)
  end

end





# airport.capacity - you are calling the capacity method on airport
# aiport.capacity = 100 means you have set the capaicty to eq 100
