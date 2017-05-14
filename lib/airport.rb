require_relative "plane"

class Airport
  attr_accessor :capacity, :planes
  DEFAULT_CAPACITY = 500

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def airport_capacity(capacity)
    @capacity
  end

  def land_in_airport(plane)
    fail "Airport is full" if full?
      @planes << plane
    end

  def leave_airport
    fail "Due to stormy weather, plane cannot take off" unless true
    @planes.pop
  end

  def full?
    @planes.count >= capacity
  end

  def weather?
    @weather_conditions = 1 + rand(10)
    if @weather_conditions <= 9
      true
    end
  end
end
