require './lib/plane'

class Airport

  attr_accessor :weather_good, :capacity

   DEFAULT_CAPACITY = 5

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather_good = true
    @capacity = capacity
  end

  def land plane
    raise "Airport is full" if planes.length >= @capacity
    raise "Weather not good cannot land" if !weather_good
    planes << plane
  end

  def take_off plane
    raise "Weather not good cannot take-off" if !weather_good
    raise "This plane is not at this airport" if !@planes.include? plane
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