class Passenger
  TICKET = true

  attr_reader :ticket

  def initialize(ticket = TICKET)
    @ticket = ticket
  end

  def ticket?
    @ticket
  end
end
