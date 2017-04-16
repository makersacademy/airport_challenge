require_relative "plane.rb"
require_relative "weather.rb"

class Airport

  attr_accessor :ground_fleet

  def initialize
    @ground_fleet = []
    @weather = Weather.new
  end

  def land(plane)
    if storms?
      raise "No landing due to weather conditions."
    elsif plane.landed?
      raise "The plane has already landed"
    else
      plane.ground
      @ground_fleet << plane
    end

  end

  def take_off(plane)
    if storms?
      raise "No taking off due to weather"
    elsif plane.on_air?
      raise "The plane has already taken off"      
    else
      plane.flying
      @ground_fleet.delete(plane)
    end
  end

  def in_airport?(plane)
    if @ground_fleet.include?(plane)
      true
    else
      false
    end
  end

  def storms?
    @weather.stormy?
  end

end
