require_relative 'plane'

class Airport
  attr_reader :planes, :weather_grade

  def initialize
    @planes = []
    @weather_grade = rand(10)   #bad weather: < 4
  end

  def land(plane)
    (@planes << plane; return plane) if @weather_grade > 4
    raise 'Sorry, the storm is too great!'
  end

  def plane_take_off
    return @planes.pop if @weather_grade > 4
    raise 'Sorry, the storm is too great!'
  end

end
