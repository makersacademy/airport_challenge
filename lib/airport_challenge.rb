require_relative "plane"
class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :capacity
  attr_reader :land
def initialize (capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @airport = []
end
  def land(plane)
    @airport << plane
    raise "The airport is full" if @airport.count >=Airport::DEFAULT_CAPACITY
    "Plane landed"
  end


  def takeoff
   @airport.pop
   "Plane took off"
  end

  def weather
    @weather = Random.new
    @condition << @weather.rand(1..10)

end
end
