class Plane
  attr_reader :state
  def initialize
    @state = 'grounded'
  end

  def land(airport)
    if airport.weather == 'clear'
      @state = 'grounded'
      @airport = airport
    end
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
