require_relative 'plane'

class Airport
  attr_accessor :capacity
  attr_reader :planes

  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = 'Sunny'
  end

  def weather
    if rand(20) > 17
      @weather = 'Stormy'
    else
      @weather = 'Sunny'
    end
  end

  def takeoff(plane)
    weather
    if @planes.empty?
      raise "There are no planes at the airport"
    elsif weather == "Stormy"
      raise "Planes cannot take off due to stormy weather"
    else
      plane.takeoff
      @planes.delete(plane)
    end
  end

  def land(plane)
    weather
    if @planes.length >= @capacity
      raise "The airport is full"
    elsif weather == "Stormy"
      raise "Planes cannot land due to stormy weather"
    else
      plane.land
      @planes << plane
    end
  end


end
