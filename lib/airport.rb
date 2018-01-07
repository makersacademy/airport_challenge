class Airport

  attr_reader :hangar, :hangar_capacity

  DEFAULT_CAPACITY = 10

  def initialize
    @hangar = []
    @hangar_capacity = DEFAULT_CAPACITY
    @weather_condition = nil
  end

  def land(plane)
    stormy_error = 'Due to current weather conditions planes cannot land'
    raise stormy_error if @weather_condition == :stormy
    @hangar << plane
  end

  def takeoff(plane)
    stormy_error = 'Due to current weather conditions all planes are grounded'
    raise stormy_error if @weather_condition == :stormy
    @hangar.delete(plane)
  end

end
