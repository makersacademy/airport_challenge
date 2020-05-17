require_relative 'plane.rb'

class Airport

  attr_reader :capacity

  def initialize(capacity = 10)
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    if !weather_check
      "You must wait due to a storm"
    elsif hanger_full
      raise "Airport full"
    else
      @hanger << plane
    end
  end

  def take_off(plane)
    if !weather_check
      "You must wait due to a storm"
    elsif hanger_empty
      raise "No planes in hanger to take off"
    else
      @hanger.delete(plane)
      "Plane has taken off"
    end
  end

  def weather_check
    rand(1..5) < 5
  end

  private

  def hanger_full
    @hanger.count >= @capacity
  end

  def hanger_empty
    @hanger.count == 0
  end
end
