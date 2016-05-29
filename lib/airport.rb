class Airport

  DEFAULT_CAPACITY = 20
  AT_CAPACITY_ERR_MSG = "Airport full! Please try another"

  def is_airport?
    true
  end

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
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

class Sky #NoAirport Class

  def is_airport?
    false
  end

  def accept_plane?(plane)
    true
  end

  def receive_plane(plane)
  end

  def release_plane(plane)
  end

end