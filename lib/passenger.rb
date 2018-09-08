class Passenger
  TICKET = true
  ON_PLANE = true

  attr_reader :luggages
  attr_accessor :ticket, :on_plane

  def initialize(ticket = TICKET, on_plane = ON_PLANE)
    @ticket = ticket
    @luggages = []
    @on_plane = on_plane
  end

  def on_plane?
    @on_plane
  end

  def ticket?
    @ticket
  end

  def drop_luggage(luggage)
    fail 'Luggage already dropped!' if luggage_dropped?(luggage) == true
    fail 'Passenger does not have ticket!' if ticket? == false
    @luggages << luggage
  end

  def get_luggage(luggage)
    fail 'Passenger already got luggage!' if luggage_dropped?(luggage) == false
    fail 'Passenger still on plane!' if on_plane?
    @luggages.delete(luggage)
  end

  def luggage_dropped?(luggage)
    @luggages.include?(luggage)
  end
end
