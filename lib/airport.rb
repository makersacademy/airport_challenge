require_relative 'plane'

class Airport
  attr_reader :planes, :weather_grade, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
    @weather_grade = rand(10) + 1
  end

  def land(plane)
    full?
    (@planes << plane; return plane) unless stormy?
  end

  def take_off(plane)
    empty?
    (plane.taking_off; @planes.delete(plane)) unless stormy?
  end

  private

  def stormy?
    raise 'Sorry, the storm is too great!' if @weather_grade < 4
  end

  def full?
    raise 'The airport is currently full.' if @planes.length >= @capacity
  end

  def empty?
    raise 'There currently are no planes available.' if @planes.empty?
  end

end


# specific plane takes off, check for authorization
# update README
# weather in own class
