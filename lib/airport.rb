class Airport

  attr_reader :hangar, :hangar_capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @hangar_capacity = capacity
    @weather_condition = nil
  end

  def land(plane)
    stormy_error = 'Due to current weather conditions planes cannot land'
    capacity_error = 'Planes cannot land due to a lack of hangar space'
    landed_error = 'Plane has already landed'
    raise stormy_error if stormy?
    raise capacity_error if full?
    raise landed_error if check_already_landed(plane)
    @hangar << plane
  end

  def takeoff(plane)
    stormy_error = 'Due to current weather conditions all planes are grounded'
    raise stormy_error if stormy?
    @hangar.delete(plane)
  end

  def stormy?
    @weather_condition == :stormy
  end

  def full?
    @hangar.count >= @hangar_capacity
  end

  def check_already_landed(plane)
    return true if @hangar.include?(plane)
  end

end
