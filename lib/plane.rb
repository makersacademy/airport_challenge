class Plane

  attr_reader :airport

  def initialize
    @flying = true
  end

  def land(airport)
    raise 'Plane already landed at another airport' unless @airport.nil?
    @flying = false
    @airport = airport
  end

  def take_off
    @flying = true
    @airport = nil
  end

  def flying?
    @flying
  end

end
