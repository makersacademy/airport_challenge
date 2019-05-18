class Airport

attr_reader :airport_store, :capacity
DEFAULT_CAPACITY = 3

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_store = []
    @capacity = capacity
  end

  def landing_plane(plane, weather)
    raise "Airport is full" if full?
    if weather == "sunny"
      airport_store << plane
    end
  end

  def take_off(plane, weather)
    if weather == "sunny"
      airport_store.pop
    end
  end

  def full?
    @airport_store.length >= DEFAULT_CAPACITY ? true : false
  end

end