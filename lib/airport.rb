require_relative "plane"

class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes= []
  end

  def takeoff(plane)
    fail "Airport is empty." if empty?
    fail "Weather is bad." if weather?
    fail "Plane not in airport" unless @planes.include? plane
      @planes.delete(plane)
  end

  def land(plane)
    fail "Airport is full." if full?
    fail "Weather is bad." if weather?
    fail "Plane already in airport." if @planes.include? plane
      @planes << plane
  end

  def grounded_planes
    @planes
  end

  def weather?
    number = rand(10)
    number.even?
  end

  private
  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.empty?
  end

end
