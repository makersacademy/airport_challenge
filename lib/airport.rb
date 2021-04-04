require_relative 'weather'
class Airport
  attr_accessor :hanger, :capacity, :weather
 
  def initialize(capacity = 1)
    @hanger = []
    @capacity = capacity
    @weather = Weather.new
  end

  def change_capacity(capacity)
    @capacity = capacity
  end  

  def full?
    true if @hanger.length == @capacity
  end

  def stormy?
    @weather.present_weather == :stormy
  end  
end
