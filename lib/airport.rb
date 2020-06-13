require './lib/weather.rb'

class Airport
  attr_accessor :docking_bay

  def initialize(capacity = 1)
    @capacity = capacity
    @docking_bay = []
  end

  def dock(plane)
    @plane = plane
    return fail "Docking station is full" if dock_is_full? == true
    return fail "Weather is too stormy to land" if weather_is_stormy? == true
    self.docking_bay << @plane
  end

  def weather_is_stormy?
    weather = Weather.new
    if weather.stormy? == true
      true
    else 
      false
    end
  end

  def dock_is_full?
    if @docking_bay.length >= @capacity
      true
    else
      false
    end
  end
  
end
