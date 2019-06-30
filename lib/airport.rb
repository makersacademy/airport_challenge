require_relative 'plane'

class Airport

attr_reader :capacity
DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane_list = []
    @capacity = capacity
  end

  def take_off(plane)
    if random_weather == "stormy"
      raise "The plane can't take off with the stormy weather"
    else
      @plane_list.pop
    end
  end

  def land(plane)
    if  random_weather == "stormy"
      raise "The plane can't land with the stormy weather"
    elsif full?
      raise "The airport is full"
    else
      @plane_list << plane
    end
  end

  def plane_status(plane)
    if plane.flying? true
      raise "The plane is already flying"
    else
      raise "The plane is already in the airport"
    end
  end

  def random_weather
    ["sunny", "stormy", "rainy", "cloudy"].sample
  end

private

  def full?
    if @plane_list.count >= DEFAULT_CAPACITY
      true
    else
      false
    end
  end

end
