class Airport
  attr_reader :planes, :capacity
  def initialize(capacity = 1)
    @planes = []
    @capacity = capacity
  end

  def receive_plane(plane)
    if @planes.length >= @capacity
      raise Exception.new
    elsif stormy?
      return "It's too stormy, can't land!"
    else
      land_valid_plane(plane)
    end
  end

  def take_off_plane(plane)
    if !(@planes.include?(plane))
      raise Exception.new
    elsif stormy?
      return "It's too stormy, can't takeoff!"
    else
      take_off_valid_plane(plane)
    end
  end

  def stormy?
    weather_result = rand(1..10)
    weather_result > 9
  end

  def land_valid_plane(plane)
    if plane.flying
      @planes << plane
      plane.set_status_as_landed
    else
      return "Plane has already landed"
    end
  end

  def take_off_valid_plane(plane)
    unless plane.flying
     plane_to_be_returned = plane
      plane.set_status_as_flying
      @planes.delete(plane)
      return plane_to_be_returned
    else
      return "Plane is already flying"
    end
  end
end
