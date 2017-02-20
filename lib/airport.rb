require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY=10
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def change_airport_capacity(value)
    @capacity = value
  end

  def land_plane(plane)
    raise "The plane cannot land again" if plane.status == 'landed'
    permission_to_land(plane)
    successful_landing(plane)
  end

  def permission_to_land(plane)
    raise "The plane cannot land in a storm" if stormy?
    raise "This airport is full, you cannot land here." if full?
  end

  def successful_landing(plane)
    @planes.push(plane)
    plane.status = 'landed'
    "The plane has landed safely"
  end

  def take_off
    raise  "The plane cannot take off in a storm" if stormy?
    permission_to_take_off
    successful_take_off
  end

  def permission_to_take_off
    raise "There are no planes to take off!" if empty?
    raise "The plane is already flying" if plane.status == 'flying'
  end

  def successful_take_off
    @planes.pop
    plane.current_position == 'flying'
    "The plane has taken off safely"
  end

  def planes
    @planes
  end

  private

  def stormy?
    @weather.stormy?
  end

  def empty?
    @planes.length == 0
  end

  def full?
    @planes.length >= capacity
  end



end
