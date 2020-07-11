require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :capacity, :hangar, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = rand(10)
  end

  def land(plane)
    raise "Airport is full" if full?
    raise "May not land due to inclement weather" if storm?
    @hangar << plane
  end

  def take_off
    raise "Hangar is empty" if empty?
    raise "May not take off due to inclement weather" if storm?
    @hangar.pop
    "Plane has departed"
  end

  def full?
    @hangar.count >= @capacity
  end

  def empty?
    @hangar.count == 0
  end 

  def storm?
    @weather == 5 ? @storm = true : @storm = false
  end
end
