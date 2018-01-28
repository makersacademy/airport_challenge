require_relative "Plane"
require_relative "Weather"

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY) 
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land, airport full" if full?
    # raise "Weather too stormy to land" if weather.stormy?
    # raise "This plane already landed" if already_landed?
    @planes << plane
    plane.landed?
  end

  def take_off(plane)
    raise "No planes available" if empty?
    # raise "This plane is not available" unless @planes.include?(plane)
    @planes.delete(plane)
    plane.flying?
  end

  def empty?
    @planes.empty?
  end

  def full?
    true if @planes.size >= @capacity
  end

  # def already_landed?
  #   plane.landed?
  # end
end
