require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :weather
  attr_reader :plane
  attr_accessor :status
  attr_accessor :hangar

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def capacity(size)
    @size = size
  end

  def land(plane)
    if @weather.clear == false
      fail 'Plane cannot land in a storm.'
    elsif plane.status == "landed"
      fail 'Plane is not flying.'
    else
      if @hangar.length < @size && plane.status == "flying"
        @status = "landed"
        @hangar.push(plane)
      else
        fail 'Plane cannot land, airport is full.'
      end
    end
  end

  def take_off(plane)
    if @weather.clear == false
      fail 'Plane cannot take-off in a storm.'
    elsif @hangar.include?(plane)
      @status = "flying"
      @hangar.delete(plane)
    else
      fail 'Plane is not in airport.'
    end
  end
  
end