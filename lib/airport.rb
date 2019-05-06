require_relative './plane'
require_relative './weather'

class Airport

  attr_reader :plane, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land_plane(*)
    fail "Stormy weather prevents landing" if @weather.stormy
  end

  def take_off(*)
    fail "Stormy weather prevents takeoff" if @weather.stormy
  end

end
