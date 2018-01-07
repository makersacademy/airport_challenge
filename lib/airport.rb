class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
    @weather_condition = nil
  end

  def land(plane)
    @hangar << plane
  end

  def takeoff(plane)
    stormy_error = 'Due to current weather conditions all planes are grounded'
    raise stormy_error if @weather_condition == :stormy
    @hangar.delete(plane)
  end

end
