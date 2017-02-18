require_relative 'plane'

class Airport

  DEFAULT_CAPACITY=10
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def change_airport_capacity(value)
    @capacity = value
  end

  def rand_weather
    rand(10)
  end

  def land_plane(plane)
    #raise "The plane cannot land again" if plane.status == 'landed'
    raise "The plane cannot land in a storm" if stormy?
    permission_to_land(plane)
  end

  def permission_to_land(plane)
    raise "This airport is full, you cannot land here." if full?
    @planes.push(plane)
    "The plane has landed safely"
  end

  def take_off
    raise  "The plane cannot take off in a storm" if stormy?
    permission_to_take_off
  end

  def permission_to_take_off
    raise "There are no planes to take off!" if empty?
    @planes.pop
    "The plane has taken off safely"
  end

  private

  def empty?
    @planes.length == 0
  end

  def full?
    @planes.length >= capacity
  end

  def stormy?
    rand_weather >= 8
  end

end
