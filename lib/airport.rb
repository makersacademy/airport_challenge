class Airport
  attr_reader :name, :parked_planes, :capacity

  DEFAULT_CAPACITY = 30

  def initialize(name = 'Heathrow', capacity = DEFAULT_CAPACITY)
    @name = name
    @parked_planes = []
    @capacity = capacity
  end

  def deliver_new_plane plane
    raise 'Plane already there' if check_for_plane(plane)
    @parked_planes << plane
  end

  def register_arrival plane
    raise 'Airport full' if @parked_planes.count >= @capacity
    @parked_planes << plane
  end

  def register_departure plane
    @parked_planes.delete(plane)
  end

  def check_for_plane plane
    @parked_planes.include? plane
  end
end
