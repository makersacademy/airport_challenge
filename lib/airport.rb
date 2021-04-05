require_relative 'weather'
class Airport
  attr_accessor :hanger
  attr_reader :capacity, :weather
  DEFAULT_CAPACITY = 1
  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
    @weather = Weather.new
  end

  def change_capacity(capacity)
    @capacity = capacity
  end  

  def full?
    @hanger.length == @capacity
  end

  def stormy?
    @weather.present_weather == :stormy
  end  
end
