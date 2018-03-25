class Airport
  attr_reader :weather, :hangar
  attr_writer :weather, :hangar


  def initialize(hangar: Array.new, weather: Weather.new)
    @hangar = hangar
    @weather = weather
  end


end
