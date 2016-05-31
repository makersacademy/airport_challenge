class Airport

  DEFAULT_CAPACITY = 20
  AT_CAPACITY_ERR_MSG = "Airport full! Please try another".freeze

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def on_ground?
    true
  end

  def accept_plane?(plane)
    room_for_plane? 
  end

  def receive_plane(plane)
    room_for_plane? ? add_plane(plane) : capacity_reached
  end

  def release_plane(plane)
    @planes.delete(plane)
  end

  private
  def room_for_plane?
    @planes.length < @capacity
  end

  def add_plane(plane)
    @planes << plane
  end

  def capacity_reached
    fail AT_CAPACITY_ERR_MSG
  end

end


# *************************************************
# NoAirport Class
class NoAirport

  def on_ground?
    false
  end

  def accept_plane?(_plane)
    true
  end

  def receive_plane(_plane)
  end

  def release_plane(_plane)
  end

end