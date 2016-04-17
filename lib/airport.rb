require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 2
  attr_reader :planes, :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @planes = []
    @capacity = capacity
  end

  def land plane
    fail "Airport is full." if full?
    fail "It's not safe to land." if safe? == false
    fail "Plane already landed." if @planes.include? plane
    @planes << plane
  end

  def take_off plane
    fail "No planes in airport." if @planes.empty?
    fail "Not safe to take off." if safe? == false
    fail "This plane has already taken off." if !@planes.include? plane
    @planes.delete(plane)
  end

  def safe?
    false if Weather.new.new_day == "Stormy"
    true
  end

  private

  def full?
    @planes.length >= @capacity
  end

end
