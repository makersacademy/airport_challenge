require_relative 'plane'

class Airport
  attr_reader :planes

  CAPACITY = 10

  def initialize(capacity = CAPACITY)
    @capacity= capacity
    @planes = []
  end

  #encapsulated planes array
  def planes
    @planes.dup
  end

  def land(plane)
    fail "The airport is full" if @planes.size > @capacity
    fail "Can't land now, it's stormy!" if weather_status <= 20
    fail "This plane has already been landed" if plane.status == "landed"
    plane.landed
    @planes << plane
  end

  def takeoff(plane)
    fail "Can't take off now, it's stormy" if weather_status <= 20
    fail "This plane is already flying" if plane.status == "flying"
    fail "This plane doesn't exist here" unless @planes.include?(plane)
    plane.fly
    @planes.reject {|p| p == plane}
    plane
  end

  private

  def weather_status
    weather = 100
    rand(weather)
  end

end
