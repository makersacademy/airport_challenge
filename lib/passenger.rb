class Passenger
  TICKET = true

  attr_reader :luggages
  attr_accessor :ticket

  def initialize(ticket = TICKET)
    @ticket = ticket
    @luggages = []
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
    @luggages.delete(luggage)
  end

  def luggage_dropped?(luggage)
    @luggages.include?(luggage)
  end
end
