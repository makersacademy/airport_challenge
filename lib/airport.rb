require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @planes = []
  end

  def confirm_landed(plane)
    @planes << plane
  end

  def confirm_take_off
    @planes.pop
  end

  def weather_status

  end

end
