require_relative 'weather'

class Airport
  def initialize
    @weather = Weather.new
  end

  def stormy?
    @weather.current == "stormy"
  end
end
