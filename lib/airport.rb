require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :holding_bay, :capacity, :sunny

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY, weather=Weather.new)
    @holding_bay = []
    @capacity = capacity
    @sunny = weather
  end

  def land(plane)
    if full?
      "The airport is full"
    else
      if sunny && plane.flying?
        plane.change_status
        holding_bay << plane
      else
        sunny ? "Plane has already landed" : "Unsafe to land plane whilst stormy"
      end
    end
  end

  def take_off
    if empty?
      "The airport is empty"
    else
        plane = holding_bay.pop
        if sunny && plane.landed?
          plane.change_status
          plane
        else
          holding_bay << plane
          sunny ? "This plane is already flying" : "Unsafe to take off plane whilst stormy"
        end
    end
  end

  private

  def full?
    holding_bay.size >= capacity
  end

  def empty?
    holding_bay.empty?
  end

end
