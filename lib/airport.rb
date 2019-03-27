
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
      add_to_hangar(plane)
    else 
      raise "The weather is too stormy, you cannot land"
    end
  end

  def take_off
    if stormy?
      raise "The weather is too stormy, you cannot take off"
    else
      remove_from_hangar
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

  def add_to_hangar(plane)
    hangar << plane
  end

  def remove_from_hangar
    hangar.pop
  end

end
