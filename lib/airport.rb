require_relative 'plane'
require_relative 'weather'

DEFAULT_CAPACITY = 20

class Airport

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    @weather = Weather.new
  end

  def takeoff
    fail("No planes are available to fly(?!)") if empty? == true
    fail("It's too stormy to fly...") if @weather.condition == "Stormy"
      @hangar.pop
      "We have lift-off!"
  end

  def land(plane)
      fail("This airport's hangar is full.") if full? == true
      fail("It's too stormy to land...") if @weather.condition == "Stormy"
      @hangar << plane
      "The plane has landed!"
  end

private

  def full?
    if @hangar.length >= @capacity
      true
    else
      false
    end
  end

  def empty?
    if @hangar.length == 0
      true
    else
      false
    end
  end
end
