require_relative 'plane'

class Airport
  attr_reader :planes, :weather_grade, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
    @weather_grade = rand(10) # bad weather: < 4
  end

  def land(plane)
    full?
    (@planes << plane; return plane) unless stormy?

  end

  def plane_take_off
    empty?
    return @planes.pop unless stormy?
  end

  private

  def stormy?
    raise 'Sorry, the storm is too great!' if @weather_grade < 4
  end

  def full?
    raise 'The airport is currently full.' if @planes.length >= @capacity
  end

  def empty?
    raise 'There currently are no planes available.'if @planes.empty?
  end
end
