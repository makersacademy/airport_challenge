require_relative 'plane'

class Airport
  attr_reader :hanger, :capacity

  def initialize(capacity = 2, hanger = [])
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    if self.weather_check == "Stormy"
      raise "Weather too bad to land"
    elsif self.full?
      raise "Airport full, ABORT LANDING"
    elsif @hanger.include?(plane)
      raise "This plane has already landed"
    else
    @hanger << plane
    end
  end

  def take_off(plane)
    if self.weather_check == "Stormy"
      raise "Weather too bad to take off"
    elsif @hanger.include?(plane)
    @hanger.delete(plane)
    @hanger
  else
    raise "Plane not available to take off"
  end
  end

  def full?
    if @hanger.length >= @capacity
      true
    end
  end

  def weather_check
    num = rand(1..6)
    case num
    when 1, 2, 4, 5, 6
      "Fine Weather"
    else
      "Stormy"
    end

  end

end
