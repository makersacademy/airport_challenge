
require_relative 'weather'

class Airport

  attr_reader :hangar, :capacity, :weather

  def initialize(weather = Weather.new)
    @hangar = []
    @capacity = 5
    @weather = weather
  end



  def land(plane) 
    if @weather.stormy? == false && @hangar.count >= @capacity
      raise "This airport is full, you cannot land here"
    elsif @weather.stormy? == false && @hangar.count < @capacity
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

end
