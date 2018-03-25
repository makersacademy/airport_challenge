class Airport
  attr_reader :weather, :hangar
  attr_writer :weather, :hangar


  def initialize(hangar: Hash.new, weather: Weather.new)
    @hangar = hangar
    @hangar["1"] = nil
    @weather = weather
  end


end
