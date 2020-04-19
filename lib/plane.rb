require_relative 'airport'
require_relative 'weather'

class Plane
  attr_reader :name, :weather
  attr_writer :name, :weather

  def initialize(name)
    @name = name
    @weather = Weather.new
  end

  def land(airport)

    if @weather.stormy?
      raise "Can't land at the moment, weather is stormy!"
    else
      if airport.list_of_planes.count < airport.capacity
        airport.list_of_planes.push(@name)
        "#{@name} has landed at #{airport.name}"
      else
        "Can't land at #{airport.name}, airport is full"
      end
    end

  end

  def take_off(airport)

    if @weather.stormy?
      raise "Can't take off at the moment, weather is stormy!"
    else
      airport.list_of_planes.delete(@name)
      "#{@name} has taken off from #{airport.name}"
    end

  end

end
