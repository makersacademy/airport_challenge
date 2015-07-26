class Airport

  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = 20
  end

  def request_landing plane
    capacity_check
    landing_authorisation plane
    receive_plane plane
  end

  def request_take_off plane
    correct_airport_check plane
    take_off_authorisation plane
    release_plane plane
  end

  private

  def capacity_check
    raise "Airport is full" if full?
  end

  def full?
    @planes.count >= @capacity
  end

  def landing_authorisation plane
    plane.land
  end

  def receive_plane plane
    @planes << plane
  end

  def correct_airport_check plane
    raise "Plane is not at this airport" unless plane_at_air_port_check plane
  end

  def plane_at_air_port_check plane
    return true if @planes.include?(plane)
  end

  def take_off_authorisation plane
    plane.take_off
  end

  def release_plane plane
    @planes.delete plane
  end
end


