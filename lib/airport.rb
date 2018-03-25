require 'weather.rb'

class Airport
  attr_reader :max_capacity, :weather

  def initialize(max_capacity = 100)
    @max_capacity = max_capacity
    @weather = set_weather
    @hangar = Array.new 
  end 

  def allow_takeoff?
    weather != :stormy
  end 

  def add_plane(airplane)
    @hangar << airplane
  end 

  def set_weather
    Weather.new 
  end 
  
  def allow_landing?
    !(@weather.stormy? || full?)
  end 
  
  def full?
    @hangar.size >= @max_capacity
  end 

  private 
  attr_reader :hangar
end 
