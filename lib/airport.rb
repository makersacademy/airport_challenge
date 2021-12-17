require_relative "airplane"

class Airport

  def initialize
    @planes = []
    @capacity
  end

  def land_airplane(plane)
    @planes.push(plane)
  end

  def airplane_take_off
  end

  # def full?
  #   true
  # end

  def weather
  end
end
