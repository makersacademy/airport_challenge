require_relative 'plane'

class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full." if full?
    (weather == "sunny") ? true : false
    @planes << plane
    plane
  end

  def landed?
    self.land == true ? true : false
  end

  def take_off
    raise "Plane cannot take off due to stormy weather." if weather == "stormy"
    raise "No planes in airport." if empty?
    @planes.pop
  end

  def departed?
    self.take_off == true ? true : false
  end

private

  def weather
    Weather.new.status
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end



end
