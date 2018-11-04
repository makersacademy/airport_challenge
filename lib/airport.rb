require_relative "./plane.rb"

class Airport

  attr_reader :hangar
  attr_reader :stormy

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @stormy = weather
    @capacity = capacity
  end

  def land(plane)
    fail "Storm warning: Unable to land" if @stormy
    fail "There are already max planes in hangar" if full?
    @hangar << plane
  end

  def takeoff(plane)
    fail "Storm warning: Unable to takeoff" if @stormy
    fail "There are already max planes in hangar" if empty?
    @hangar.pop
  end

  private

  def empty?
    @hangar.empty?
  end

  def full?
    @hangar.count >= @capacity
  end

  def weather
    rand(1..4) < 2 ? true : false
  end

end
