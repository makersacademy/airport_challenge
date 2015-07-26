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
    plane.take_off
  end
end


