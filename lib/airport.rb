require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :planes
  attr_accessor :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def landing(plane)
    @planes << plane

  end

  def take_off(plane)
   raise "No take off: Stormy weather" if @weather.stormy
    plane.confirm_take_off
    @planes.delete(plane)
    @planes
  end
end
