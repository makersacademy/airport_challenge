require './lib/plane'

class Airport

  attr_accessor :weather_good

   DEFAULT_CAPACITY = 5

  def initialize
    @planes = []
    @weather_good = true
  end

  def lands plane
    raise "Airport is full" if planes.length >= 5
    raise "Weather not good cannot land" if !weather_good
    planes << plane
  end

  def takes_off plane
    raise "This plane is not at this airport" if !@planes.include? plane
    raise "Weather not good cannot take-off" if !weather_good
    planes.delete_if {|item| item == plane}
    plane
  end

  def weather_good? weather
    if weather == "sunny"
      @weather_good = true
    elsif weather == "stormy"
      @weather_good = false
    end
  end

  private

  attr_accessor :planes

end