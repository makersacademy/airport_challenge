class Passenger
  TICKET = true
  ON_PLANE = false

  attr_reader :luggages, :ticket, :on_plane

  def initialize(ticket = TICKET, on_plane = ON_PLANE)
    @ticket = ticket
    @luggage = true
    @on_plane = on_plane
  end

  def on_plane?
    @on_plane
  end

  def ticket?
    @ticket
  end

  def drop_luggage
    fail 'Luggage already dropped!' if luggage_dropped?
    fail 'Passenger does not have ticket!' unless ticket?
    @luggage = false
    'Luggage dropped!'
  end

  def collect_luggage
    fail 'Passenger already got luggage!' unless luggage_dropped?
    fail 'Passenger still on plane!' if on_plane?
    @luggage = true
    'Luggage collected!'
  end

  def luggage_dropped?
    !@luggage
  end

  def leave
    @on_plane = false
  end

  def boarded
    @on_plane = true
  end
end
