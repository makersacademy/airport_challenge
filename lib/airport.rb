require_relative "weather"
require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 2
  attr_reader :planes, :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @planes = []
    @capacity = capacity
  end

  def land plane
    fail "Airport is full." if full?
    fail "It's not safe to land." if !safe?
    fail "Plane already landed." if @planes.include? plane
    @planes << plane
  end

  def take_off plane
    fail "No planes in airport." if @planes.empty?
    fail "Not safe to take off." if !safe?
    fail "Plane already taken off." if !@planes.include? plane
    @planes.delete(plane)
  end

  def safe?
    (Weather.new).new_day == "Stormy" ? false : true
  end

  private

  def full?
    @planes.length >= @capacity
  end

end
