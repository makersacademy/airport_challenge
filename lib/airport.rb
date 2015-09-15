require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 5

  attr_reader :capacity, :today_weather
  def initialize (capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def today_weather
  Weather.new.stormy

  end

  def clear_to_land(plane)
    if @planes.count >= @capacity
      raise 'Airport at Capacity'
    elsif today_weather == 'stormy'
      raise 'Stormy!'
    else
      plane.land
      @planes << plane
    end
  end


  def clear_to_take_off(plane)
    if today_weather == 'stormy'
      raise 'Stormy!'
    else
      plane = @planes.pop
      plane.take_off
    end
  end

  def planes
    @planes
  end

  def count_planes
    @planes.count
  end

  def capacity
  @capacity
  end


end
