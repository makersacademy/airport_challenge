class Passenger
  TICKET = true
  ON_PLANE = true

  attr_reader :luggages
  attr_accessor :ticket, :on_plane

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
    fail 'Passenger does not have ticket!' if !ticket?
    @luggage = false
  end

  def get_luggage
    fail 'Passenger already got luggage!' if !luggage_dropped?
    fail 'Passenger still on plane!' if on_plane?
    @luggage = true
  end

  def luggage_dropped?
    !@luggage
  end
end
