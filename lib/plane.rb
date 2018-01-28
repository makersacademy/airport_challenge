require_relative 'airport'

class Plane

  attr_reader :current_airport

  def initialize
    @current_airport
  end

  def land(airport)
    landing_sequence(airport) if landing_status(airport)
  end

  def take_off
    unless take_off_status == false
      take_off_sequence
      take_off_message
    end
  end

private

  def landing_status(airport)
    if airport.weather == :stormy
      fail "It's stormy here. Cannot land at this airport"
    elsif airport.is_full?
      fail "This airport is full. Cannot land here"
    else
      true
    end
  end

  def landing_sequence(airport)
    airport.planes << self
    @current_airport = airport
  end

  def take_off_sequence
    @current_airport.planes.delete(self)
    @current_airport = nil
  end

  def take_off_message
    print "Plane has left airport"
  end

  def take_off_status
    if @current_airport == nil
      fail "You are currently in flight"
    elsif @current_airport.weather == :stormy
      fail "It's stormy. Cannot take off from this airport"
    else
      true
    end
  end

end
