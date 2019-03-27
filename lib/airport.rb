
require_relative 'weather'

class Airport

CAPACITY = 5

  attr_reader :hangar, :capacity

  def initialize(weather = Weather.new, capacity = CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end



  def land(plane) 
    if !stormy? && @hangar.count >= @capacity
      raise "This airport is full, you cannot land here"
    elsif !stormy? && @hangar.count < @capacity
      @hangar << plane
    else 
      raise "The weather is too stormy, you cannot land"
    end
  end

  def take_off(plane)
    if @weather.stormy? == true
      raise "The weather is too stormy, you cannot take off"
    else
      @hangar.pop
    end
  end

  def change_capacity_to(capacity)
    capacity > 0 ? @capacity = capacity : @capacity = 5
  end

  private

  attr_reader :weather

  def stormy?
    weather.stormy?
  end

end
