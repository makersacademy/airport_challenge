class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full!" if full?
    fail "Cannot land the same plane" if @planes.include? plane
    @planes << plane
    @plane = plane
  end

  def take_off
    fail "no planes available for take-off!" if empty?
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

  # def same_plane?
  #   @plane = @plane
  # end

end
