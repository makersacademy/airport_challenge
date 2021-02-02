require_relative 'plane'

class Airport
  attr_accessor :capacity, :planes
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def approved_for_landing(tail_number)
    check_landing_conditions(tail_number)
    @planes << tail_number
  end

  def approved_for_takeoff(tail_number)
    @planes.delete(tail_number)
  end

  def plane_count
    @planes.length
  end

  def stormy?
    # rand(1..10) > 7
    false
  end

  def check_landing_conditions(tail_number)
    raise "Plane cannot land because airport is at full capacity" if full?

    raise "Weather is still stormy, please wait for weather to improve before landing" if stormy?
  end

  private

  def full?
    @planes.length >= @capacity
  end
  
end
