require_relative 'communicator'

class Plane
  include Communicator

  def initialize(airport = Airport.new)
    self.landed_at(airport)
    airport.dock(self)
  end

  def landed?
    !flying
  end

  def flying?
    flying
  end

  def current_airport
    airport
  end

  def landed_at(airport)
    @airport = airport
    @flying = false
    true
  end

  def is_flying
    @airport = 'no airport'
    @flying = true
    true
  end

  private
  attr_accessor :flying, :airport

end
