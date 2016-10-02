class Plane
  attr_reader :state
  def initialize
    @state = 'grounded'
  end

  def land(airport)
    @state = 'grounded'
    @airport = airport
  end

  def take_off
    @state = 'flying'
  end

  def confirm
    @state
  end

  def location
    @location = @state == 'grounded' ? @airport : 'airborne'
  end
end
