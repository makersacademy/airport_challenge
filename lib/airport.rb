class Airport

  attr_reader :name, :weather

  def initialize(name, weather = Weather.new)
    @name = name
    @weather = weather
  end

end
