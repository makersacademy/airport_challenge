require_relative "plane"
require_relative "weather"

class Airport
  include Weather
  DEFAULT_CAPACITY =  10

  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Landing impossible due to stormy weather" if stormy?
    raise "This airport is full" if full?
    raise "This plane is already landed" if plane.state == :landed
    accept(plane)
  end

  def on_airport?(plane)
    planes.include? plane
  end

  def confirm(plane)
    on_airport?(plane) ? "The plane has landed" : "The plane has taken off"
  end

  def take_off(plane = planes.last)
    raise "Take-off impossible due to stormy weather" if stormy?
    raise "This plane is not present at this airport!" if !(on_airport?(plane))
    raise "This plane cannot use an airport when flying!" if plane.state == :flying
    release(plane)
  end

  private

  def full?
    planes.size >= capacity
  end

  def accept(plane)
    plane.state = :landed
    planes << plane
    confirm(plane)
  end

  def release(plane)
    planes.delete(plane)
    plane.state = :flying
    confirm(plane)
  end

end
