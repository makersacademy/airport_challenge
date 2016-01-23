require_relative 'plane'

class Airport

  CAPACITY = 10

  def initialize
    @planes = []
  end

  #encapsulated planes array
  def planes
    @planes.dup
  end

  def land(plane)
    raise "The airport is full" if @planes.size > CAPACITY
    raise "Can't land now, it's stormy!" if weather_status == "stormy"
    plane.landed
    @planes << plane
  end

  def takeoff
    raise "Can't take off now, it's stormy" if weather_status == "stormy"
    @plane[0].flying
    @planes.shift
  end

  private

  def weather_status
    weather = ["sunny","sunny","sunny","sunny","stormy",
               "sunny","sunny","stormy","sunny","sunny"]
    weather.sample
  end

end
