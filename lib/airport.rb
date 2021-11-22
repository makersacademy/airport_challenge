require_relative('./weather')

class Airport
  attr_reader :local_weather, :parked_planes, :capacity

  include Weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @parked_planes = []
    @local_weather = check_weather
  end 

  def full?
    true if @parked_planes.count >= DEFAULT_CAPACITY
  end

  def update_weather
    @local_weather = check_weather
  end

end
