require './lib/weather.rb'

class Airport

  attr_reader :planes, :weather

  def initialize(weather = Weather)
    @planes = []
    @weather = weather
  end

  def accept(plane)
    fail "This plane is not currently flying." if plane.landed?
    fail "This plane cannot depart due to adverse weather conditions" if is_stormy?
    plane.land
    planes << plane
  end

  def depart(plane)
    fail "This plane is not at this airport." unless planes.include? plane
    fail "This plane cannot depart due to adverse weather conditions" if is_stormy?
    plane.depart
    planes.delete(plane)
  end

  def present?(plane)
    planes.include? plane
  end

  def is_stormy?
    Weather.new.stormy?
  end

end
