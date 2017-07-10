class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  #Refactor to use fail statements
  def land_plane
    weather_status = weather?
    if weather_status == 'calm' && full? == false
      planes << Plane.new
    elsif weather_status == 'stormy'
      'Landing delayed due to bad weather'
    else
      'Landing delayed due to airport capacity reached'
    end
  end

  #Refactor to use fail statements
  def release_plane
    weather_status = weather?
    if weather_status == 'calm' && airport_has_plane? == true
      planes.shift
    elsif weather_status == 'stormy'
      'Takeoff delayed due to bad weather'
    else
      'No planes available'
    end
  end

  def land_multiple_planes(n)
    n.times {land_plane}
  end

  def release_multiple_planes(n)
    n.times {release_plane}
  end

  private

  def airport_has_plane?
    planes == [] ? false : true
  end

  def weather?
    Weather.new.weather
  end

  def full?
    planes.length == capacity
  end
end
