require 'weather.rb'

class Airport

  attr_reader :hangar, :capacity, :weather

  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    if is_fair_weather? then
      plane.land!(@weather)
      hangar.push(plane)
    end
  end

  def taxi(plane)
    if is_fair_weather? then
      plane.take_off!(@weather)
      @hangar.delete_at(@hangar.find_index(plane))
    end
  end

private
  def is_fair_weather?
    @weather.condition == "Sunny"
  end
end
