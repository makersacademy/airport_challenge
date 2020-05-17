require_relative 'plane.rb'

class Airport

  attr_reader :capacity

  def initialize(capacity = 10)
    @capacity = capacity
    @airport = []
  end

  def land(plane)
    if !weather_check
      "You must wait due to a storm"
    elsif capacity_check
      raise "Airport full"
    else
      @airport << plane
    end
  end

  def take_off
    if !weather_check
      "You must wait due to a storm"
    else
      "Plane has taken off"
    end
  end

  def weather_check
    rand(1..5) < 5
  end

  private

  def capacity_check
    @airport.length >= @capacity
  end
end
