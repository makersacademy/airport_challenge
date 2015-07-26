class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def request_landing plane
    landing_authorisation plane
    receive_plane plane
  end

  def landing_authorisation plane
    plane.land
  end

  def receive_plane plane
    @planes << plane
  end

  def request_take_off plane
    take_off_authorisation plane
    release_plane plane
  end

  def take_off_authorisation plane
    plane.take_off
  end

  def release_plane plane
    @planes.delete plane
  end
end


