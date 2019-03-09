require_relative 'weather.rb'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    raise "Cannot land due to stormy weather" if stormy?

    @hangar << plane
  end

  def take_off
    raise "Cannot depart due to stormy weather" if stormy?

    @hangar.pop
  end

  def stormy?
    Weather.new.forecast == 'Stormy'
  end

end
