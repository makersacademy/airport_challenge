require_relative "plane"

class Airport
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = ["clear"]
  end
  DEFAULT_CAPACITY = 4
  attr_reader :plane, :planes
  attr_accessor :capacity

  def land_plane(plane)
    fail "Cannot do that" unless safe?
    fail "Cannot do that, airport full" if full?
    @planes << plane
  end

  def take_off
    fail "Cannot do that" unless safe?

    @planes.pop
  end

  def conditions(weather)
    @weather.delete_at(0)
    @weather << weather
  end

  def full?
    if @planes.count < DEFAULT_CAPACITY
      false
    else
      true
    end
  end

  def safe?
    if @weather == ["clear"]
      true
    elsif @weather == ["stormy"]
      false
    end
  end

end
