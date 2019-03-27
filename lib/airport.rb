
require_relative 'weather'

class Airport

CAPACITY = 5

  attr_reader :hangar

  def initialize(weather = Weather.new, capacity = CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end



  def land(plane) 
    if !stormy? && full?
      raise "This airport is full, you cannot land here"
    elsif !stormy? && !full?
      @hangar << plane
    else 
      raise "The weather is too stormy, you cannot land"
    end
  end

  def take_off(plane)
    if stormy?
      raise "The weather is too stormy, you cannot take off"
    else
      @hangar.pop
    end
  end

  def change_capacity_to(capacity)
    capacity > 0 ? @capacity = capacity : @capacity = 5
  end

  private

  attr_reader :weather, :capacity

  def stormy?
    weather.stormy?
  end

  def full?
    hangar.count >= capacity
  end

end
