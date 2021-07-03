class Plane
  attr_reader :airport
  DEFAULT_POSITION = 'In flight'
  
  def initialize
    @airport = DEFAULT_POSITION
  end

  def land(airport)
    @airport = airport
  end

  def take_off
    @airport = DEFAULT_POSITION
  end
end
