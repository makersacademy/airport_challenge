require_relative "plane.rb"

class Airport
  attr_reader :hanger
  DEFAULT_CAPACITY = 20

  def initialize
    @hanger = []
  end

  def land(plane)
    fail "plane has already landed" if @hanger.include? plane

    fail "airport is full, cannot land plane" if full?

    fail "cannot land, weather is too stormy" if stormy?

    @hanger.push(plane)
  end

  def takeoff(plane)
    fail "plane is not in airport, can't takeoff" unless plane_in_hanger?(plane)

    fail "cannot takeoff, weather is too stormy" if stormy?

    @hanger.delete(plane)
    "#{plane} has taken off"
  end

  private

  def plane_in_hanger?(plane)
    @hanger.include? plane
  end

  def full?
    @hanger.count >= DEFAULT_CAPACITY
  end

  def stormy?
    randomnumber == 10
  end

  def randomnumber
    rand(1..10)
  end
end
